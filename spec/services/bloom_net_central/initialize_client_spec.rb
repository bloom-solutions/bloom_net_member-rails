require 'rails_helper'

module BloomNetCenter
  RSpec.describe InitializeClient do

    it "sets the BloomNetCenterClient in the context" do
      resulting_ctx = described_class.execute
      expect(resulting_ctx.central_client).to be_a BloomNetCenterClient::Client
    end

  end
end
