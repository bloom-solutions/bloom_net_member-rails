module Claims
  class TriggerClaim

    extend LightService::Action
    expects :claim
    promises :create_claim_response

    executed do |c|
      uri = URI(ENV["BLOOM_NET_CENTRAL_HOST"])
      uri.path = "/api/v1/claims"

      body = {
        claim: c.claim.attributes.slice(
          "recipient_first_name",
          "recipient_last_name",
          "ref_no",
        ).merge(destination: ENV["BLOOM_NET_ACCOUNT"])
      }.to_json

      headers = { "Content-Type" => "application/json" }

      c.create_claim_response =
        HTTParty.post(uri.to_s, body: body, headers: headers)

      c.claim.claiming!
    end

  end
end
