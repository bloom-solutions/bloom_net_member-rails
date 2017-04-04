require 'rails_helper'

RSpec.describe ProcessStellarOperation do

  let(:operation) { create(:stellar_lookout_operation) }

  it "enqueues a ProcessStellarOperationJob" do
    described_class.(operation)
    expect(StellarLookoutProcessing::ProcessOperationJob).
      to have_been_enqueued.with(operation)
  end

end
