module Txns
  class UpdateTxn

    extend LightService::Action
    expects :create_txn_response

    executed do |c|
      remote_txn = c.create_txn_response.txn

      c.txn.update_attributes!(
        external_id: remote_txn.id,
        ref_no: remote_txn.ref_no,
        status: "funding",
        remote_status: remote_txn.status,
      )
    end

  end
end
