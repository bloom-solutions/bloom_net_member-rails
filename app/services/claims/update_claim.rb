module Claims
  class UpdateClaim

    extend LightService::Action
    expects :claim, :find_txn_response

    executed do |c|
      # TODO: center should only show the txn if it's unclaimed, therefore,
      # the member can be sure that it's claimable
      body = JSON.parse(c.find_txn_response.body).with_indifferent_access
      data = body[:data]
      txn_attributes = data.first
      # if none, then mark the claim as claim_error
    end

  end
end
