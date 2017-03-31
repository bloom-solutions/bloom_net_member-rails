require 'rails_helper'

module Txns
  RSpec.describe UpdateTxn do

    let(:txn) { build_stubbed(:txn) }
    let(:resulting_ctx) do
      described_class.execute({
        txn: txn,
        create_txn_response: create_txn_response,
      })
    end

    context "create_txn_response is successful" do
      let(:create_txn_response) do
        BloomNetCenterClient::CreateTxnResponse.new({
          success: true,
          txn: remote_txn,
        })
      end
      let(:remote_txn) do
        BloomNetCenterClient::Txn.new(
          id: "KUMAWAWA",
          status: "unfunded",
          account: "GDAC",
        )
      end

      it "updates the local txn" do
        expect(txn).to receive(:update_attributes!).with(
          external_id: "KUMAWAWA",
          ref_no: "KUMAWAWA",
          status: "funding",
          remote_status: "unfunded",
          address: "GDAC",
        )

        resulting_ctx
      end
    end

    context "create_txn_response is not successful" do
      let(:create_txn_response) do
        BloomNetCenterClient::CreateTxnResponse.new(success: false, body: "body")
      end

      it "marks the txn with `center_error` and fails the ctx" do
        expect(txn).to receive(:center_error!)
        expect(resulting_ctx).to be_failure
      end
    end

  end
end
