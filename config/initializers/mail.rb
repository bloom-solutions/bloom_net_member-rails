ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  address: Settings.smtp.address,
  port: Settings.smtp.port,
  user_name: Settings.smtp.username,
  password: Settings.smtp.password,
}
