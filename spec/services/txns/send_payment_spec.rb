require 'rails_helper'

module Txns
  RSpec.describe SendPayment do

    let(:txn) do
      build_stubbed(:txn, {
        amount: 2500,
        currency: "PHP",
        address: "GDAC",
        ref_no: "KUMAWALA",
      })
    end
    let(:bridge_client) { BridgeClient::Client.new }
    let(:bridge_response) { BridgeClient::SendPaymentResponse.new }

    it "sends the txn amount to the address" do
      expect(bridge_client).to receive(:send_payment).with(
        destination: "GDAC",
        amount: 2500,
        asset_code: "PHP",
        asset_issuer: ENV["BLOOM_NET_ISSUER_ACCOUNT"],
        memo_type: "text",
        memo: "KUMAWALA",
      ).and_return(bridge_response)

      resulting_ctx = described_class.execute({
        txn: txn,
        bridge_client: bridge_client,
      })

      expect(resulting_ctx.bridge_response).to eq bridge_response
    end

  end
end
