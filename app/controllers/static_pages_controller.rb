class StaticPagesController < ApplicationController
  def home
    @rides = Ride.all
  end

  def help
  end
  
  def about
  end
  
  def contac
  end
  
  def signup
  end
  
end
