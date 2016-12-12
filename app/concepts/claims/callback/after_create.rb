module Claims
  module Callback
    class AfterCreate

      extend LightService::Organizer

      def self.call(claim)
        with(claim: claim).reduce(
          FindRemoteTxn,
          TriggerClaim,
          # UpdateClaim,
        )
      end

    end
  end
end
