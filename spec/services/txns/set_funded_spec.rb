require 'rails_helper'

module Txns
  RSpec.describe SetFunded do

    let(:txn) { create(:txn) }

    it "sets statuses" do
      described_class.execute(txn: txn)
      txn.reload
      expect(txn).to be_fund_sent
      expect(txn.remote_status).to eq "funded"
    end

  end
end
