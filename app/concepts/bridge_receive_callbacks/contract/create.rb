module BridgeReceiveCallbacks
  module Contract
    class Create < ApplicationContract

      property :external_id
      property :from
      property :route
      property :amount
      property :asset_code
      property :memo_type
      property :memo
      property :data
      property :id, virtual: true

      def id=(v)
        self.external_id = v
      end

    end
  end
end
