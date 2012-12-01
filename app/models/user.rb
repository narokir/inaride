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
  attr_accessible :name, :email, :uid, :last_name, :first_name
  has_many :rides, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.usr_img= auth.info.image
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
