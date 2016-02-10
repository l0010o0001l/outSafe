# @todo Write tests
class ProfileController < ApplicationController
  before_action :authenticate_user!

  def update
    @profile = Profile.find_by(user_id: current_user[:id])
    @profile.update(profile_params)
    redirect_to profile_path, notice: "Profile successfully updated!"
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
     redirect_to root_url, notice: "We're sorry to see you go. :("
    end
  end

  def profile_params
    params.permit!
    profile_attributes = params["profile"]
  end
end
