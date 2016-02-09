class ProfileController < ApplicationController
  before_action :authenticate_user!

  def update
    @profile = Profile.find_by(user_id: current_user[:id])
    @profile.update!
    redirect_to profile_path, notice: "Profile successfully updated!"
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
     redirect_to root_url, notice: "User deleted."
    end
  end
end
