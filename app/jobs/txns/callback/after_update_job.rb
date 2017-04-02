module Txns
  module Callback
    class AfterUpdateJob < ApplicationJob

      def perform(txn)
        Txns::AfterUpdate.(txn)
      end

    end
  end
end
