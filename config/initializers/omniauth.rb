OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'503197923030255', '886cedc0272b03013b130004af9824f1'
end