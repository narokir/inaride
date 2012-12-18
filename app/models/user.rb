class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :first_name, :last_name, :usr_img
  has_many :rides, dependent: :destroy
  
  has_secure_password
  
  before_save { self.email.downcase! }
  before_save { |user| user.email = email.downcase }
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
		    format: 		{ with: VALID_EMAIL_REGEX },
		    uniqueness: 	{ case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true
  validates_confirmation_of :password





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
  
  
  def image
    if usr_img.present?
      usr_img
    else
      usr_img = "/assets/user_placeholder.png"
    end
  end
  
  def full_name
    first_name + " " + last_name.slice!(0,1)
  end
end
