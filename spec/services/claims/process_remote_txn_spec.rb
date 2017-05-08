require 'rails_helper'

module Claims
  RSpec.describe ProcessRemoteTxn do

    let(:remote_txn) { BloomNetCenterClient::Txn.new(ref_no: "REFNO") }
    let(:claim) { build_stubbed(:claim) }

    it "saves the txn_ref_no of the remote_txn" do
      expect(claim).to receive(:update_attributes!).with(
        txn_ref_no: "REFNO",
      )

      described_class.execute(claim: claim, remote_txn: remote_txn)
    end

  end
end
