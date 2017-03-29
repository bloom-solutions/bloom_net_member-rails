module Txns
  class SendPayment

    extend LightService::Action
    expects :bridge_client, :txn
    promises :bridge_response

    executed do |c|
      txn = c.txn

      c.bridge_response = c.bridge_client.send_payment(
        destination: txn.address,
        amount: txn.amount,
        asset_code: "PHP",
        asset_issuer: Settings.bloom_net_issuer_account,
        memo_type: "text",
        memo: txn.ref_no,
      )
    end

  end
end
