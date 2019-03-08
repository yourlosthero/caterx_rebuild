OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1957982941198055', 'c418b20d8d99848fe9fc49cc1bfbfa3e'
end