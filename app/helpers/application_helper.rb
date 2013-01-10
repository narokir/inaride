module ApplicationHelper
  # Returns full title on per-page basis
  def full_title(page_title)
    base_title="inaride"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  # Display placeholder for user profile image if unavailable
  def usr_profile_img
    if @user.usr_img.present?
      @user.usr_img = "/assets/user_placeholder.png"
      current_user.usr_img = "/assets/user_placeholder.png"
    else
      @user.usr_img
    end
  end
  
  def driver_profile_img
    if ride.user.usr_img.present?
      ride.user.usr_img = "/assets/user_placeholder.png"
    end
  end
  
  def seats
    if @ride.seats.present?
    @ride.seats
    else
    @ride_seats = "0"
    end
  end
  
end