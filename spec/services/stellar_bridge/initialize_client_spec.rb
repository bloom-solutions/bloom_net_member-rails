require 'rails_helper'

module StellarBridge
  RSpec.describe InitializeClient do

    it "initializes a BridgeClient::Client" do
      resulting_ctx = described_class.execute
      expect(resulting_ctx.bridge_client).to be_a BridgeClient::Client
    end

  end
end
