module Txns
  module Contract
    class Create < ApplicationContract

      property :sender_first_name
      property :sender_last_name
      property :sender_mobile
      property :sender_street
      property :sender_city
      property :sender_region
      property :recipient_first_name
      property :recipient_last_name
      property :recipient_mobile
      property :recipient_street
      property :recipient_city
      property :recipient_region
      property :amount

      validation :default do
        required(:recipient_first_name).filled
        required(:recipient_last_name).filled
        required(:recipient_mobile).filled
        required(:amount).filled
      end

    end
  end
end
