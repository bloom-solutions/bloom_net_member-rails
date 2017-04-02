require 'rails_helper'

module Txns
  module Callback
    RSpec.describe AfterUpdateJob do

      let(:txn) { build_stubbed(:txn) }

      it "delegates work to Txns::AfterUpdate" do
        expect(Txns::AfterUpdate).to receive(:call).with(txn)
        described_class.new.perform(txn)
      end

    end
  end
end
