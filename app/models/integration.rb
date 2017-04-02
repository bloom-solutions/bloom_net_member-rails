class Integration < ApplicationRecord

  has_many :api_tokens, dependent: :destroy

end
