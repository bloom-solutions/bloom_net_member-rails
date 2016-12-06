module Txns
  class CreateRemoteTxn

    extend LightService::Action
    expects :txn
    promises :create_response

    executed do |c|
      uri = URI(ENV["BLOOM_NET_CENTRAL_HOST"])
      uri.path = "/api/v1/txns"
      body = {
        txn: {
          recipient_first_name: c.txn.recipient_first_name,
          recipient_last_name: c.txn.recipient_last_name,
        }
      }.to_json
      headers = {"Content-Type" => "application/json"}
      c.create_response = HTTParty.post(uri.to_s, headers: headers, body: body)
    end

  end
end
