module Claims
  class FetchRemoteTxn

    extend LightService::Action
    expects :center_client, :claim
    promises :remote_txn

    executed do |c|
      response = c.center_client.find_txn(c.claim.tracking_no)
      c.remote_txn = response.txn
    end

  end
end
