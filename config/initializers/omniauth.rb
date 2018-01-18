

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['641ABC0A0188A1A24B863B16FAC771C4']
end