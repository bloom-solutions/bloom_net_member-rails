module Txns
  module Contract
    class Create < ApplicationContract

      property :recipient_first_name
      property :recipient_last_name
      property :amount

    end
  end
end
