require 'rails_helper'

module Txns
  RSpec.describe WatchAddress do

    let(:txn) { build_stubbed(:txn, address: "GCAD") }

    it "watches the txn's address" do
      expect(StellarLookout::Watch).to receive(:call).with("GCAD")
      described_class.execute(txn: txn)
    end

  end
end
