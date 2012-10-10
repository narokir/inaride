class Ride < ActiveRecord::Base
  attr_accessible :origin, :destination, :date, :title, :latitude, :longitude, :user_id, :gmaps
  belongs_to :user
  
  validates_presence_of :origin, :destination, :date
  acts_as_gmappable #:process_geocoding => false
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  #"#{self.street}, #{self.city}, #{self.country}"
  "#{self.origin}, #{self.destination}"
  end
  
  def gmaps4rails_marker_picture
  {
   "picture" => "/assets/map_marker_red.png",
   "width" => 32,
   "height" => 41,
   "marker_anchor" => [ 14, 40],
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
  arel = arel.where('CAST(date as TEXT)LIKE ?', params[:date]) if params[:date].present?
  arel
  end
  
end





