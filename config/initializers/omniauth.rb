OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :facebook,'503197923030255', '886cedc0272b03013b130004af9824f1',
    #TODO: store facebook app_id and Key in yml
  #provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
	    :scope => 'email,user_birthday,user_likes,user_interests,user_about_me,user_education_history,user_work_history',
	    :display => 'popup',
	    :secure_image_url => 'true',
	    :image_size => 'square'

end