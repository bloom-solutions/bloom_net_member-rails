require 'rails_helper'

module StellarLookoutProcessing
  RSpec.describe ProcessOperation do

    context "transaction memo is not a claim that is being claimed" do
      let!(:claim) { create(:claim, txn_ref_no: "AJAKALA", status: "fresh") }
      let(:stellar_lookout_txn) do
        build(:stellar_lookout_txn, memo: "BABBA")
      end
      let(:stellar_lookout_operation) do
        build_stubbed(:stellar_lookout_operation, {
          txn: stellar_lookout_txn,
          to: Settings.bloom_net_address,
        })
      end

      it "does nothing" do
        expect(ProcessOperationAsPaymentForClaim).to_not receive(:call)
        described_class.(stellar_lookout_operation)
      end
    end

    context "`to` address does not match our inbound address" do
      # (we might be watching others)
      let!(:claim) { create(:claim, txn_ref_no: "AJAKALA") }
      let(:stellar_lookout_txn) do
        build(:stellar_lookout_txn, memo: "AJAKALA")
      end
      let(:stellar_lookout_operation) do
        build_stubbed(:stellar_lookout_operation, {
          txn: stellar_lookout_txn,
          to: "SOMEOTHERADDRESS",
        })
      end

      it "does nothing" do
        expect(ProcessOperationAsPaymentForClaim).to_not receive(:call)
        described_class.(stellar_lookout_operation)
      end
    end


    context "operation is for a claim" do
      let!(:claim) { create(:claim, txn_ref_no: "AJAKALA") }
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

      it "calls ProcessOperationAsPaymentForClaim" do
        expect(ProcessOperationAsPaymentForClaim).to receive(:call).
          with(stellar_lookout_operation)
        described_class.(stellar_lookout_operation)
      end
    end

    context "operation is for a txn" do
      let!(:txn) { create(:txn, ref_no: "AJAKALA", address: "GCAT") }
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

      it "calls ProcessOperationAsPaymentForTxn" do
        expect(ProcessOperationAsPaymentForTxn).to receive(:call).
          with(stellar_lookout_operation)
        described_class.(stellar_lookout_operation)
      end
    end

  end
end
