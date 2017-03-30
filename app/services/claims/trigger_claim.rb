module Claims
  class TriggerClaim

    extend LightService::Action
    expects :center_client, :claim
    promises :create_claim_response

    executed do |c|
      claim_args = c.claim.attributes.slice(
        "recipient_first_name",
        "recipient_last_name",
        "ref_no",
      ).merge(destination: ENV["BLOOM_NET_ACCOUNT"])
      c.create_claim_response = c.center_client.create_claim(claim_args)

      c.claim.claiming!
    end

  end
end
