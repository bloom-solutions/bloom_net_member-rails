module Claims
  module Contract
    class Create < ApplicationContract

      property :recipient_first_name
      property :recipient_last_name
      property :ref_no

    end
  end
end
