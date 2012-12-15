module UsersHelper
  # Display placeholder for user profile image if unavailable
  def usr_profile_img
    if @user.usr_img.blank?
      @user.usr_img = "/assets/user_placeholder.png"
    else
      @user.usr_img
    end
  end
  
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
