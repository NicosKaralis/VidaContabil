class UserMailer < ActionMailer::Base
  default :from => "nicoskaralis@eu.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    mail(:to => user.email, :subject => "Your password has been reset")
  end
  
  def activation_needed_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def activation_success_email(user)
    @user = user
    mail(:to => user.email, :subject => "Your account is now activated")  
  end
  
end
