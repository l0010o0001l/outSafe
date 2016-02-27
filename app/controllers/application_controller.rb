class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:after_sign_in_path_for]

  def after_sign_in_path_for(user)
    ((current_user.sign_in_count == 1) ? profile_edit_path : parties_path )
  end

  def after_sign_out_path_for(user)
    root_path
  end

  # def location
  #   if params[:location].blank?
  #     if Rails.env.test? || Rails.env.development?
  #       @location ||= "Portland, OR"
  #     else
  #       @location ||= request.location
  #     end
  #   else
  #     params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
  #     @location ||= Geocoder.search(params[:location]).first
  #     @location
  #   end
  # end
end
