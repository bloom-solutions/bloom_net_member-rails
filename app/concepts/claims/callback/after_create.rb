module Claims
  module Callback
    class AfterCreate

      extend LightService::Organizer

      def self.call(claim)
        with(claim: claim).reduce(
          BloomNetCenter::InitializeClient,
          FetchRemoteTxn,
          ProcessRemoteTxn,
          TriggerClaim,
          WatchAddress,
          # UpdateClaim,
        )
      end

    end
  end
end
