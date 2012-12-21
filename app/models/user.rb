# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  email            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  usr_img          :string(255)
#  password_digest  :string(255)
#  first_name       :string(255)
#  last_name        :string(255)
#

class User < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name, :email, :password, :password_confirmation, :first_name, :last_name, :usr_img
<<<<<<< HEAD
  has_many :rides, dependent: :destroy
=======
  has_many :rides, :dependent => :destroy
=======
  attr_accessible :name, :email, :uid, :last_name, :first_name
  has_many :rides, dependent: :destroy
>>>>>>> 1a50efd987ec34acbb6320229a971099cad3ffaa
>>>>>>> 24f802f3ed36f25cb31ec4df74716ed564ecd882
  
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
end
