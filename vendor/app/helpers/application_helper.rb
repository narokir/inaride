module ApplicationHelper
  # Returns full title on per-page basis
  def full_title(page_title)
    base_title="Inoride"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  # Display placeholder for user profile image if unavailable
  def usr_profile_img
    if @user.usr_img.blank?
      @user.usr_img = "/assets/user_placeholder.png"
    else
      @user.usr_img
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