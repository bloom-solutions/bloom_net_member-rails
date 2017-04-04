require 'rails_helper'

RSpec.describe ProcessStellarOperation do

  let(:remote_op) { create(:stellar_lookout_operation) }

  it "enqueues a ProcessStellarOperationJob" do
    described_class.(remote_op)
    expect(ProcessStellarOperationJob).to have_been_enqueued.with(remote_op)
  end

end
