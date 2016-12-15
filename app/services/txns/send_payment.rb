module Txns
  class SendPayment

    extend LightService::Action
    expects :bridge_client, :txn
    promises :bridge_response

    executed do |c|
      txn = c.txn

      c.bridge_response = c.bridge_client.send_payment(
        destination: ENV["BLOOM_NET_CENTRAL_BASE_ACCOUNT"],
        amount: txn.amount,
        asset_code: "PHP",
        asset_issuer: ENV["BLOOM_NET_ISSUER_ACCOUNT"],
        memo_type: "text",
        memo: txn.external_id,
      )
    end

  end
end
