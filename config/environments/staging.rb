OutSafe::Application.configure do

  config.consider_all_requests_local = false
  config.assets.debug = false
  config.log_level = :info
  config.assets.version = '1.0'
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.assets.digest = true
  config.cache_classes = false
  config.assets.enabled = true
  config.eager_load = true
  config.action_controller.perform_caching = false
  config.serve_static_files = true
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass
  config.assets.compile = false
  config.active_support.deprecation = :log
  config.i18n.fallbacks = true

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => 'outsafe-stage',
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }

  # General Settings
  config.app_domain = 'yoshimi.herokuapp.com'

  # Email
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: config.app_domain }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: 'someuser', # @todo create mailer account
    password: 'somepass',
    authentication: :plain,
    domain: 'yoshimi.herokuapp.com'
  }
end
