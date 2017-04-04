require 'rails_helper'

module StellarLookoutProcessing
  RSpec.describe ProcessOperationAsPaymentForTxn do

    let!(:txn) do
      create(:txn, status: "fund_sent", ref_no: "AJAKALA", address: "GCAT")
    end
    let(:stellar_lookout_txn) do
      build(:stellar_lookout_txn, memo: "AJAKALA")
    end
    let(:stellar_lookout_operation) do
      build_stubbed(:stellar_lookout_operation, {
        txn: stellar_lookout_txn,
        to: "GCAT",
        amount: 5020.0,
      })
    end

    it "updates the txn as `funded`" do
      described_class.(stellar_lookout_operation)
      txn.reload
      expect(txn).to be_funded
    end

  end
end
