module Txns
  module Callback
    class AfterCreate

      extend LightService::Organizer

      def self.call(txn)
        with(txn: txn).reduce(
          # post central
          CreateRemoteTxn,
          # update txn with new info
          # TODO: move to create a response object, and process the response.
          # This way, if there was an issue posting we will see it, and we would
          # know how to continue from there.
          UpdateTxn,
          # create payment in horizon
          # TODO: Move to create a payment object with its own status and
          # responses. This way, we can recover if something goes wrong along
          # the way.
          SendPayment,
          # TODO: best to get callback from central to know what status to
          # become
          SetFunded,
        )
        # wait callback from central about `funded`, update status
        # after this:
        # - create callback for horizon
        # - mark txn as paid when callback is called
      end

    end
  end
end
