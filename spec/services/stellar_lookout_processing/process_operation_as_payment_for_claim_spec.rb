require 'rails_helper'

module StellarLookoutProcessing
  RSpec.describe ProcessOperationAsPaymentForClaim do

    let!(:claim) { create(:claim, ref_no: "AJAKALA", status: "claiming") }
    let(:stellar_lookout_txn) do
      build(:stellar_lookout_txn, memo: "AJAKALA")
    end
    let(:stellar_lookout_operation) do
      build_stubbed(:stellar_lookout_operation, {
        txn: stellar_lookout_txn,
        to: Settings.bloom_net_address,
        amount: 5020.0,
      })
    end

    it "updates the amount and completes the claim" do
      described_class.(stellar_lookout_operation)

      claim.reload

      expect(claim.amount).to eq 5020.0
      expect(claim).to be_completed
    end

  end
end
