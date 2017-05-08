module Txns
  class UpdateTxn

    extend LightService::Action
    expects :create_txn_response, :txn

    executed do |c|
      response = c.create_txn_response
      txn = c.txn

      if response.success?
        remote_txn = response.txn
        Operation::Update.(
          {
            "txn" => {
              external_id: remote_txn.id,
              ref_no: remote_txn.ref_no,
              tracking_no: remote_txn.tracking_no,
              status: "funding",
              remote_status: remote_txn.status,
              address: remote_txn.account,
            }
          },
          { "txn" => txn }
        )
      else
        txn.center_error!
        c.fail! "Unable to create txn on center: #{response.body}"
      end
    end

  end
end
