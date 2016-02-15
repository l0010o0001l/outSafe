
Devise.setup do |config|
  require 'devise/orm/active_record'
  require "omniauth-facebook"
  # config.mailer_sender = ''
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.warden do |manager|
    manager.failure_app = CustomFailure
  end
  config.secret_key = 'ba10eaea1e9f84bc447214b12aebf69cc55d084dcf67cd79db9005ae9a94329385be7e4ffb0d3dd40d8014aba8f6cdfc8256c3bba15ce978afed8c9957a84e4c'
  config.omniauth :facebook, ENV["facebook_app_id"], ENV["facebook_secret"], provider_ignores_state: true
end
