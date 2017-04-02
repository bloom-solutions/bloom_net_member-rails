module Claims
  class UpdateTxn

    extend LightService::Action
    expects :claim

    executed do |c|
      Rails.logger.info "Update txn#remote_status with ref_no #{c.claim.ref_no} to be `claiming`"
      txn = Txn.find_by!(ref_no: c.claim.ref_no)
      Txns::Operation::Update.(
        { "txn" => { remote_status: "claiming" } },
        { "txn" => txn },
      )
    end

  end
end
