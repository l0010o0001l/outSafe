OutSafe::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Minorly dev-specific
  config.consider_all_requests_local = true
  config.assets.debug = true
  config.assets.compile = true
  config.log_level = :debug
  config.active_record.migration_error = :page_load
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Dev/Prod parity
  config.assets.digest = true
  config.cache_classes = false # Code is reloaded between requests
  config.assets.enabled = true
  config.eager_load = true
  config.action_controller.perform_caching = false
  config.serve_static_files = true
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass
  config.active_support.deprecation = :log
  config.i18n.fallbacks = true

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => 'outsafe-dev',
      :s3_credentials => "#{Rails.root}/config/aws.yml",
    }
  }

  # config.action_mailer.raise_delivery_errors = false
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
