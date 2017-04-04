class ProcessStellarOperationJob < ApplicationJob

  def perform(remote_op)
    remote_txn = remote_op.txn

    if remote_op.to == Settings.bloom_net_address &&
        claim = Claim.find_by(ref_no: remote_txn.memo)

      claim.update_attributes(
        amount: remote_op.amount,
        status: "completed",
      )
    end
  end

end
