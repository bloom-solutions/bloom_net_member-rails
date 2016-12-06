module Claims
  module Callback
    class AfterCreate

      extend LightService::Organizer

      def self.call(claim)
        with(claim: claim).reduce(
          FindRemoteTxn,
          UpdateClaim,
          # UpdateTxn, # we do not have the txn locally
          TriggerClaim,
        )
      end

    end
  end
end
