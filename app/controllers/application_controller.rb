class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_users_list
  
private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end

  def reset_password_not_found
    redirect_to root_url, :alert => "Password already changed or not existent."
  end
  
  def not_activated
    redirect_to login_url, :alert => "User could not be activated."
  end
  
protected
  def current_users_list
    current_users.map {|u| u.email}.join(", ")
  end
end
