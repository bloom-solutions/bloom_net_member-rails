module Claims
  class FindRemoteTxn

    extend LightService::Action
    expects :claim
    promises :find_txn_response

    executed do |c|
      uri = URI.parse(ENV["BLOOM_NET_CENTRAL_HOST"])
      uri.path = "/api/v1/txns"

      headers = { "Content-Type" => "application/json" }
      params = {
        recipient_first_name: c.claim.recipient_first_name,
        recipient_last_name: c.claim.recipient_last_name,
        ref_no: c.claim.ref_no,
      }

      c.find_txn_response =
        HTTParty.get(uri.to_s, query: params, headers: headers)
    end

  end
end
