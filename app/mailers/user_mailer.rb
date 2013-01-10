class UserMailer < ActionMailer::Base

  default :from => 'no-reply@pickmeup.com'
  default :sender => 'narek@pickmeup.com'
  
  def registration_confirmation(user)
    @user = user
    attachments.inline["email_header.png"] = File.read("#{Rails.root}/public/email_header.png")
    mail(to: user.email, subject: "Welcome to Pickmeup")
  end
  
  def ride_request(user)
    @user = user
    mail(to: ride.user.email, subject: "Can I get a ride", :from => current_user.email)
  end
end
