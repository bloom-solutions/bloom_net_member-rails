module Txns
  module Callback
    class AfterCreate

      extend LightService::Organizer

      def self.call(txn)
        with(txn: txn).reduce(
          BloomNetCenter::InitializeClient,
          CreateRemoteTxn,
          UpdateTxn,
          StellarBridge::InitializeClient,
          # create payment in horizon
          # TODO: Move to create a payment object with its own status and
          # responses. This way, we can recover if something goes wrong along
          # the way.
          SendPayment,
          # TODO: best to get callback from center to know what status to
          # become
          SetFunded,
        )
        # wait callback from center about `funded`, update status
        # after this:
        # - create callback for horizon
        # - mark txn as paid when callback is called
      end

    end
  end
end
