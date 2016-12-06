module BridgeReceiveCallbacks
  module Callback
    class AfterCreateJob < ApplicationJob

      def perform(bridge_receive_callback)
        AfterCreate.(bridge_receive_callback)
      end

    end
  end
end
