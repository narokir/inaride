module UsersHelper
  # Display placeholder for user profile image if unavailable

  
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
    
  def profile_image_for(user)
    if user.usr_img.present?
      user.usr_img
    else
      user.usr_img = "/assets/user_placeholder.png"
    end
  end
  
  def full_name
    user.first_name + " " + user.last_name
  end
  
end
