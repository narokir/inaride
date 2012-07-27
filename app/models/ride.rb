class Ride < ActiveRecord::Base
  belongs_to :user
  acts_as_gmappable #:process_geocoding => false
  
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  #"#{self.street}, #{self.city}, #{self.country}"
  "#{self.origin}, #{self.destination}"
  end
  

  def gmaps4rails_infowindow
    "<h1>Hi This is an infowindow</h1>"
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
   #"rich_marker" =>  "<div class='my-marker'>It works!<img height='30' width='30' src='http://farm4.static.flickr.com/3212/3012579547_097e27ced9_m.jpg'/></div>"
  }
  end
  

 def gmaps4rails_sidebar
  "#{self.origin}, #{self.destination}"
  end

  def gmaps4rails_title
      "<p>I am a title</p>"
  end
end
