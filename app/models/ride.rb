# == Schema Information
#
# Table name: rides
#
#  id          :integer          not null, primary key
#  origin      :string(255)
#  destination :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  latitude    :float
#  longitude   :float
#  gmaps       :boolean
#  date        :datetime
#  price       :integer
#  seats       :integer
#  time        :time
#  notes       :text
#

class Ride < ActiveRecord::Base
  attr_accessible :origin, :destination, :date, :title, :latitude, :longitude, :gmaps, :price, :seats, :notes,:time
  belongs_to :user

  validates_presence_of :origin, :destination, :date, :price, :seats
  acts_as_gmappable :validation => false #:process_geocoding => true 

  def gmaps4rails_address
  "#{self.origin}, #{self.destination}"
  end

  def gmaps4rails_marker_picture
  {
   "picture" => "/assets/map_marker_red.png",
   "width" => 55,
   "height" => 23,
   "marker_anchor" => [ 22, 40],
   "shadow_picture" => "/images/morgan.png" ,
   "shadow_width" => "110",
   "shadow_height" => "110",
   "shadow_anchor" => [5, 10],
  }
  end

  def self.search(params)
    arel = order('created_at ASC') # note: default is all, just sorted
    arel = arel.where('origin LIKE ?', params[:origin]).order('created_at DESC') if params[:origin].present?
    arel = arel.where('destination LIKE ?', params[:destination]) if params[:destination].present?
    arel = arel.where('CAST(date as TEXT)LIKE ?', "%#{params[:date]}%") if params[:date].present?
    arel
  end  
end





