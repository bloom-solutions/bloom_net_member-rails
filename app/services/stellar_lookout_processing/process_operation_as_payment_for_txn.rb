module StellarLookoutProcessing
  class ProcessOperationAsPaymentForTxn

    def self.call(operation)
      txn = Txn.find_by(ref_no: operation.txn.memo, address: operation.to)
      txn.funded!
    end

  end
end
