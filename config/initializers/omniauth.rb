OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :facebook, FACEBOOK_CONFIG['FACEBOOK_APP_ID'], FACEBOOK_CONFIG['FACEBOOK_SECRET'],
	    :scope => 'email,user_birthday,user_likes,user_interests,user_about_me,user_education_history,user_work_history',
	    :display => 'popup',
	    :secure_image_url => 'true',
	    :image_size => 'square'

end