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
  )

end
