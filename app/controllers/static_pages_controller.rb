class StaticPagesController < ApplicationController
  def home
    @ride = Ride.all(limit: 4)
  end

  def help
  end
  
  def about
    
  end
  
  def contac
  end
  
  def signup
  end
  
  def signin
  end
  
end
