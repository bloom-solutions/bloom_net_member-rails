module Claims
  class UpdateClaim

    extend LightService::Action
    expects :claim, :find_txn_response

    executed do |c|
      body = JSON.parse(c.find_txn_response.body).with_indifferent_access
      data = body[:data]
      txn_attributes = data.first

      Rails.logger.info "Updating claim..."
      begin
      c.claim.update_attributes!(
        txn_status: txn_attributes[:status],
      )
      rescue => e
        Rails.logger.info e.backtrace
      end
    end

  end
end
