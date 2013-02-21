class User < ActiveRecord::Base
  has_many :rides, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name,
		  :first_name, :last_name, :usr_img, :birthday, :gender, :education,
		  :provider, :uid

  validates_uniqueness_of :email

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
			   provider:auth.provider,
			   uid:auth.uid,
			   email:auth.info.email,
			   first_name:auth.info.first_name,
			   last_name:auth.info.last_name,
			   usr_img:auth.info.image,
			   gender:auth.extra.raw_info.gender,
			   password:Devise.friendly_token[0,20]
			   )
      user.save!
    end
    user
  end
  
  def confirm!
    welcome_message
    super
  end
  
  def full_name
    first_name + " " + last_name
  end
  
  private

  def welcome_message
    UserMailer.registration_email(@user).deliver
  end



  #def self.from_omniauth(auth)
  #  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #    user.provider = auth.provider
  #    user.uid = auth.uid
  #    user.usr_img= auth.info.image
  #    user.name = auth.info.name
  #    user.password = 'foobar'
  #    user.password_confirmation = 'foobar'
  #    user.first_name = auth.info.first_name
  #    user.last_name = auth.info.last_name
  #    #user.birthday = auth.extra.raw_info.birthday.to_s
  #    #user.gender = auth.extra.raw_info.gender
  #    #user.education= auth.extra.raw_info.education[1].school.name
  #    user.email = auth.info.email
  #    user.oauth_token = auth.credentials.token
  #    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #    user.save!
  #  end
  #end
    

  def self.image
    if usr_img.present?
      usr_img
    else
      usr_img = "/assets/user_placeholder.png"
    end
  end
  
end
