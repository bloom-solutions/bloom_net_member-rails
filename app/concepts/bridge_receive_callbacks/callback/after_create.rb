module BridgeReceiveCallbacks
  module Callback
    class AfterCreate

      def self.call(bridge_receive_callback)
        # should probably find by the claim's status, not its txn_status
        claim = Claim.find_by!(
          txn_status: "funded",
          ref_no: bridge_receive_callback.memo,
        )

        # should really ask central what the status is. but what if we have
        # processed the BRC but central hasn't yet?
        claim.update_attributes!(
          txn_status: "completed",
          amount: bridge_receive_callback.amount,
        )

        # What if there are multiple claims for one txn?
        # txn = Txn.find_by!(ref_no: bridge_receive_callback.memo)
        # txn.update_attributes!(status: "claimed")
      end

    end
  end
end
