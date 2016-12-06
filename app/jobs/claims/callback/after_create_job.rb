module Claims
  module Callback
    class AfterCreateJob < ApplicationJob

      def perform(claim)
        AfterCreate.(claim)
      end

    end
  end
end
