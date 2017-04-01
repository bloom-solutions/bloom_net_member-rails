class User < ApplicationRecord

  devise(
    :confirmable,
    :database_authenticatable,
    :lockable,
    :recoverable,
    :rememberable,
    :timeoutable,
    :trackable,
    :validatable,
    :registerable,
  )

  # Enable async delivery of mail
  # https://github.com/plataformatec/devise#activejob-integration
  # Too bad it's in the model
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

end
