Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_cable.url = "ws://localhost:3000/cable"

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 587,
    domain: 'sandbox788a7a9c907443d1915f8f03a89de454.mailgun.org',
    authentication: 'plain',
    user_name: 'postmaster@sandbox788a7a9c907443d1915f8f03a89de454.mailgun.org',
    password: 'e79e91c94fd49239681450da146eb38f'
  }
  # config.action_mailer.smtp_settings = {
  #   address: 'smtp.gmail.com',
  #   port: 587,
  #   enable_starttls_auto: true,
  #   authentication: 'plain',
  #   user_name: 'YOU_GMAIL_ADDRESS',
  #   password: 'YOUR_GMAIL_PASSWORD'
  # }

  config.paperclip_defaults = {
    storage: :s3,
    path: ':class/:attachment/:id/:style/:filename',
    s3_host_name: 's3-us-west-2.amazonaws.com',
    s3_credentials: {
      bucket: 'airpikachu2',
      access_key_id: 'AKIAJVTZJ6HFJT7BL4TA',
      secret_access_key: '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',
      s3_region: 'us-west-2'
    }
  }
end