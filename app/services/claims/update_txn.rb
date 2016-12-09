module Claims
  class UpdateTxn

    extend LightService::Action
    expects :claim

    executed do |c|
      Rails.logger.info "Update txn with ref_no #{c.claim.ref_no} to be `claiming`"
      txn = Txn.find_by!(ref_no: c.claim.ref_no)

      # should probably get this status from Central
      txn.update_attributes!(remote_status: "claiming")
    end

  end
end
