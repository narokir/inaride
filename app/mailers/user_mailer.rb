class UserMailer < ActionMailer::Base

  default :from => 'no-reply@pickmeup.com'
  default :sender => 'narek@pickmeup.com'
  
  def registration_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Inaride")
  end
  
  def weekly(email)
    mail to: email, subject: "inaride Weekly"
  end
  
  def forgot_password(user)
  end

end
