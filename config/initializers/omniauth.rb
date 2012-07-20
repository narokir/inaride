OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'503197923030255', '662b07792aa8def71c7f80af79fdc2ef'
end