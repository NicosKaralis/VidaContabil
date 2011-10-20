ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address => "mail.vidacontabil.com.br",
  :port => 25,
  :domain => "vidacontabil.com.br",
  :authentication => :login,
  :user_name => "rh@vidacontabil.com.br",
  :password => "rhcontabil",
}