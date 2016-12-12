module Txns
  class CreateRemoteTxn

    extend LightService::Action
    expects :central_client, :txn
    promises :create_txn_response

    executed do |c|
      txn = c.txn

      c.create_txn_response = c.central_client.create_txn(
        recipient_first_name: txn.recipient_first_name,
        recipient_last_name: txn.recipient_last_name,
      )
    end

  end
end
