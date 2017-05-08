module StellarLookoutProcessing
  class ProcessOperationAsPaymentForClaim

    def self.call(operation)
      claim = Claim.find_by(txn_ref_no: operation.txn.memo)
      claim.update_attributes(
        amount: operation.amount,
        status: "completed",
      )
    end

  end
end
