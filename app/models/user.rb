class User < ActiveRecord::Base
  attr_accessible :usr_img, :name, :email, :uid, :id, :provider
  has_many :rides, :dependent => :destroy
  belongs_to :static_pages
  
  validates :name, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.usr_img= auth.info.image
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
