module Claims
  class ProcessRemoteTxn

    extend LightService::Action
    expects :remote_txn, :claim

    executed do |c|
      c.claim.update_attributes!(
        txn_ref_no: c.remote_txn.ref_no,
      )
    end

  end
end
