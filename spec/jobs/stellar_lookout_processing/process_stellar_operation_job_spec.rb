require 'rails_helper'

module StellarLookoutProcessing
  RSpec.describe ProcessOperationJob do

    let(:operation) { build_stubbed(:stellar_lookout_operation) }

    it "delegates work to StellarLookoutProcessing::ProcessOperation" do
      expect(StellarLookoutProcessing::ProcessOperation).to receive(:call).
        with(operation)

      described_class.new.perform(operation)
    end

  end
end
