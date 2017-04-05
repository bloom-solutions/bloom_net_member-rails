module Txns
  class HandleBridgeResponse

    extend LightService::Action
    expects :bridge_response, :txn

    STATUS_MAP = {
      payment_underfunded: :lack_funds,
    }.with_indifferent_access

    executed do |c|
      response = c.bridge_response

      next if response.success?

      c.txn.update_attributes(status: status_from(response))
      c.fail! response.message
    end

    private

    def self.status_from(bridge_response)
      STATUS_MAP[bridge_response.code_str] || "bridge_error"
    end

  end
end
