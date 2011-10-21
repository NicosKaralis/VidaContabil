class PagesController < ApplicationController
  before_filter :require_login, :only => [:secret]
  
  def home
    # flash.now[:success] = "This is an success!"
    # flash.now[:alert] = "This is an alert!"
    # flash.now[:info] = "This is an info!"
    # flash.now[:error] = "This is an error!"
    if !current_user
      redirect_to login_url
    end
  end

  def secret
  end

end
