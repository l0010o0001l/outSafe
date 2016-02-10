class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    ((current_user.sign_in_count == 1) ? profile_edit_path : parties_path )
  end

  def after_sign_out_path_for(user)
    root_path
  end
end
