class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def username
    return self.email.split("@")[0]
  end
  
  def self.load_from_token(token, token_attr_name, token_expiration_date_attr)
    return nil if token.blank?
    user = User.find_by_sql("SELECT * from users WHERE trim(#{token_attr_name}) = '#{token}'").first
    if !user.blank? && !user.send(token_expiration_date_attr).nil?
      return Time.now.utc < user.send(token_expiration_date_attr) ? user : nil
    end
    user
  end
  
end
