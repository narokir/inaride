class User < ActiveRecord::Base
  has_many :rides, dependent: :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name,
		  :first_name, :last_name, :usr_img, :birthday, :gender, :education
    
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  
  
  validates :password, presence: true, length: { minimum: 6 }
  #validates_confirmation_of :password





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
      #user.birthday = auth.extra.raw_info.birthday.to_s
      #user.gender = auth.extra.raw_info.gender
      #user.education= auth.extra.raw_info.education[1].school.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Ride.where("user_id = ?", id)
  end
  
  
  def image
    if usr_img.present?
      usr_img
    else
      usr_img = "/assets/user_placeholder.png"
    end
  end
  
  def full_name
    first_name + " " + last_name
  end
end
