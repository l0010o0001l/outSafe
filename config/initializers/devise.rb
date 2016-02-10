
Devise.setup do |config|
  require 'devise/orm/active_record'
  # config.mailer_sender = ''
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :facebook
  config.warden do |manager|
    manager.failure_app = CustomFailure
  end
end
