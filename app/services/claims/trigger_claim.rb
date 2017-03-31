module Claims
  class TriggerClaim

    extend LightService::Action
    expects :center_client, :claim
    promises :create_claim_response

    executed do |c|
      c.create_claim_response = c.center_client.create_claim({
        ref_no: c.claim.ref_no,
        destination: Settings.bloom_net_address,
      })

      # TODO go to claiming only if the response is successful
      c.claim.claiming!
    end

  end
end
