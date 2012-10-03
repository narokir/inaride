class Ride < ActiveRecord::Base
  attr_accessible :origin, :destination, :date, :title, :latitude, :longitude, :user_id, :gmaps
  belongs_to :user
  
  validates_presence_of :origin, :destination, :date
  acts_as_gmappable #:process_geocoding => false
  
  
  def self.search(params)
  arel = order('created_at ASC') # note: default is all, just sorted
  arel = arel.where('origin LIKE ?', params[:origin]).order('created_at DESC') if params[:origin].present?
  arel = arel.where('destination LIKE ?', params[:destination]) if params[:destination].present?
  arel = arel.where('date LIKE ?', params[:date]) if params[:date].present?
  arel
  end
  
end





