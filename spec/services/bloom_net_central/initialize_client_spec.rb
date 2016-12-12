require 'rails_helper'

module BloomNetCentral
  RSpec.describe InitializeClient do

    it "sets the BloomNetCentralClient in the context" do
      resulting_ctx = described_class.execute
      expect(resulting_ctx.central_client).to be_a BloomNetCentralClient::Client
    end

  end
end
