class Map < ActiveRecord::Base
  attr_accessible :destination, :gmaps, :latitude, :longitude, :origin, :title, :waypoint_1
  acts_as_gmappable #:process_geocoding => false
  
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  #"#{self.street}, #{self.city}, #{self.country}"
  "#{self.origin}, #{self.destination}"
  end
  

  def gmaps4rails_infowindow
    "<h1>#{origin}</h1>"
    
  end	
  

  def gmaps4rails_marker_picture
  {
   "picture" => "/assets/map_marker_red.png",
   "width" => 32,
   "height" => 41,
   "marker_anchor" => [ 5, 10],
   "shadow_picture" => "/images/morgan.png" ,
   "shadow_width" => "110",
   "shadow_height" => "110",
   "shadow_anchor" => [5, 10],
   "rich_marker" =>  "<div class='my-marker'>Put Whatever you like here<img height='41' width='32' src='/assets/map_marker_red.png'/></div>"
  }
  end
  

 def gmaps4rails_sidebar
  "#{origin} --------> #{destination}" 
  end

  def gmaps4rails_title
      "<p>#{origin}</p>"
  end
end
