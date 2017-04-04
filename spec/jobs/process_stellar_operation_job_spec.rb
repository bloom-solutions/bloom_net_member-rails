require 'rails_helper'

RSpec.describe ProcessStellarOperationJob do

  context "transaction memo includes a claim that is being claimed" do
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

    it "updates the claim" do
      described_class.new.perform(stellar_lookout_operation)

      claim.reload

      expect(claim.amount).to eq 5020.0
      expect(claim).to be_completed
    end
  end

  context "transaction memo is not a claim that is being claimed" do
    let!(:claim) { create(:claim, ref_no: "AJAKALA", status: "claiming") }
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
      described_class.new.perform(stellar_lookout_operation)
      claim.reload
      expect(claim).to be_claiming
    end
  end

  context "`to` address does not match our inbound address" do
    # (we might be watching others)
    let!(:claim) { create(:claim, ref_no: "AJAKALA", status: "claiming") }
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
      described_class.new.perform(stellar_lookout_operation)
      claim.reload
      expect(claim).to be_claiming
    end
  end

end
