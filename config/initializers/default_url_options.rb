ActionMailer::Base.default_url_options =
  Rails.application.routes.default_url_options =
  {
    host: Settings.host,
    port: Settings.port,
    protocol: Settings.protocol,
  }
