



Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, Rails.application.secrets.STEAM_WEB_API_KEY
end