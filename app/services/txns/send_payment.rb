module Txns
  class SendPayment

    extend LightService::Action
    expects :txn
    promises :bridge_response

    executed do |c|
      txn = c.txn

      uri = URI(ENV["STELLAR_BRIDGE_HOST"])
      uri.path = "/payment"

      headers = {"Content-Type" => "application/json"}
      body = {
        destination: ENV["BLOOM_NET_CENTRAL_BASE_ACCOUNT"],
        amount: txn.amount,
        asset_code: "PHP",
        asset_issuer: ENV["BLOOM_NET_ISSUER_ACCOUNT"],
        memo_type: "text",
        memo: txn.ref_no,
      }.to_json

      c.bridge_response = HTTParty.post(uri.to_s, headers: headers, body: body)
    end

  end
end
