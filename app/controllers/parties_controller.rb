class PartiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_party, only: [:show, :edit, :update, :destroy]
  before_action :current_location, only: [:index]
  before_action :latitude, only: [:index]
  before_action :longitude, only: [:index]

  def host?
    current_user.profile.host
  end

  def index
    parties_near_location
  end

  def parties_near_location
    if current_location.present?
      @parties = Party.near(current_location)
      build_map_markers
    else
      @parties = Party.all
      build_map_markers
    end
  end

  def show
  end

  def new
    if host?
      @party = Party.new
    else
      redirect_to parties_path, notice: 'You need to enable yourself as a host to create parties! Go to Settings.'
    end
  end

  def edit
  end

  def join_request
    if current_user.profile.guest == true
      ##
    else
      redirect_to parties_path, notice: 'You need to enable yourself as a guest to create parties! Go to Settings.'
    end
  end

  def create
    @party = Party.new(party_params)
    @party.user_id = current_user.id # assigns current user as party owner

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    def party_params
      params.require(:party).permit(:user_id, :title, :address, :min_age, :description)
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    def current_location
      if Rails.env.test? || Rails.env.development?
        @location ||= "Portland, OR"
      else
        @location ||= request.location.city
      end
    end

    def latitude
      coor = Geocoder.coordinates(current_location)
      @lat = coor[0]
    end

    def longitude
      coor = Geocoder.coordinates(current_location)
      @long = coor[1]
    end

    def build_map_markers
      @hash = Gmaps4rails.build_markers(@parties) do |party, marker|
        marker.lat party.latitude
        marker.lng party.longitude
      end
    end
end
