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
          SendPayment,
          HandleBridgeResponse,
          WatchAddress,
        )
        # wait callback from center about `funded`, update status
        # after this:
        # - create callback for horizon
        # - mark txn as paid when callback is called
      end

    end
  end
end
