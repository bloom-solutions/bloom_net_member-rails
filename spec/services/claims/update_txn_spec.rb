require 'rails_helper'

module Claims
  RSpec.describe UpdateTxn do

    let(:txn) { create(:txn) }
    let(:claim) { create(:claim, ref_no: txn.ref_no) }

    it "updates the txn that matches the ref_no to `claiming`" do
      described_class.execute(claim: claim)
      txn.reload
      expect(txn.remote_status).to eq "claiming"
    end

  end
end
