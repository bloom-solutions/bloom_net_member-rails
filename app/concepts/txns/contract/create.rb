module Txns
  module Contract
    class Create < ApplicationContract

      property :sender_first_name
      property :sender_last_name
      property :recipient_first_name
      property :recipient_last_name
      property :recipient_mobile
      property :amount

      validation :default do
        required(:recipient_first_name).filled
        required(:recipient_last_name).filled
        required(:amount).filled
      end

    end
  end
end
