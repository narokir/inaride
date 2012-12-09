class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :first_name, :last_name, :usr_img
  has_many :rides, dependent: :destroy
  
  has_secure_password
  
  before_save { self.email.downcase! }
  before_save { |user| user.email = email.downcase }
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true



  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.usr_img= auth.info.image
      user.name = auth.info.name
      user.password = 'foobar'
      user.password_confirmation = 'foobar'
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
