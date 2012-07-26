class Ride < ActiveRecord::Base
  belongs_to :user
  connected?
end
