class PasswordResetsController < ApplicationController
  skip_before_filter :require_login
  
  def new
  end
  
  # request password reset.
  # you get here when the user entered his email in the reset password form and submitted it.
  def create
    @user = User.find_by_email(params[:email])
  
    if @user
      # This line sends an email to the user with instructions on how to reset their password (a url with a random token)
      @user.deliver_reset_password_instructions!
      
      # Tell the user instructions have been sent whether or not email was found.
      # This is to not leak information to attackers about which emails exist in the system.
      redirect_to root_path, :notice => 'Instructions have been sent to your email.'
    else
      redirect_to new_password_reset_path, :alert => 'Email was not found in database.'
    end
  end

  # This is the reset password form.
  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]
    reset_password_not_found if !@user
  end

  # This action fires when the user has sent the reset password form.
  def update
    @token = params[:token]
    @user = User.load_from_reset_password_token(params[:token])
    not_authenticated if !@user
    # the next line makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to root_path, :notice => 'Password was successfully updated.'
    else
      render :action => "edit"
    end
  end

end
