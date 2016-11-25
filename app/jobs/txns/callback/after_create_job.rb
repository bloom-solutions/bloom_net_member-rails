module Txns
  module Callback
    class AfterCreateJob < ApplicationJob

      def perform(txn)
        AfterCreate.(txn)
      end

    end
  end
end
