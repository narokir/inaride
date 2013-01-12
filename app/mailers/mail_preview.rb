  class MailPreview < MailView
    # Pull data from existing fixtures
    def registration_email
      user = Struct.new(:email, :first_name).new('nxk01240@gmail.com', 'Narek')
      mail = UserMailer.registration_email(user)
    end
    
    def weekly
      email = "name@example.com"
      mail = UserMailer.weekly(email)
    end

    # Factory-like pattern
    def welcome
      user = User.create!
      mail = Notifier.welcome(user)
      user.destroy
      mail
    end

    # Stub-like
    def forgot_password
      user = Struct.new(:email, :name).new('name@example.com', 'Jill Smith')
      mail = UserMailer.forgot_password(user)
    end
  end