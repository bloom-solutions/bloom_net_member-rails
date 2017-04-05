require 'rails_helper'

module Txns
  RSpec.describe HandleBridgeResponse do

    let(:txn) { create(:txn, status: "funding") }
    let(:resulting_ctx) do
      described_class.execute(txn: txn, bridge_response: bridge_response)
    end

    context "bridge response is successful" do
      let(:bridge_response) do
        BridgeClient::SendPaymentResponse.new(success: true)
      end

      it "does nothing" do
        expect(resulting_ctx).to_not be_failure
      end
    end

    described_class::STATUS_MAP.each do |bridge_code, txn_status|
      context "bridge response is not successful with a code of `#{bridge_code}`" do
        let(:bridge_response) do
          BridgeClient::SendPaymentResponse.new({
            success: false,
            code_str: bridge_code,
            message: "Not enough funds to send this transaction.",
          })
        end

        it "fails the context and updates the txn status to `#{txn_status}`" do
          expect(resulting_ctx).to be_failure
          expect(resulting_ctx.message).to eq bridge_response.message

          txn.reload
          expect(txn.send("#{txn_status}?")).to be true
        end
      end
    end

    context "bridge is not successful with an unknown code" do
      let(:bridge_response) do
        BridgeClient::SendPaymentResponse.new({
          success: false,
          code_str: "unknown",
          message: "Bridge message",
        })
      end

      it "fails the context and updates the txn status to `bridge_error`" do
        expect(resulting_ctx).to be_failure
        expect(resulting_ctx.message).to eq "Bridge message"

        txn.reload
        expect(txn).to be_bridge_error
      end
    end

  end
end
