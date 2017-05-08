require 'rails_helper'

module Txns
  RSpec.describe UpdateTxn do

    let(:txn) { create(:txn) }
    let(:resulting_ctx) do
      described_class.execute({
        txn: txn,
        create_txn_response: create_txn_response,
      })
    end
    let(:resulting_txn) { resulting_ctx.txn }

    context "create_txn_response is successful" do
      let(:create_txn_response) do
        BloomNetCenterClient::CreateTxnResponse.new({
          success: true,
          txn: remote_txn,
        })
      end
      let(:remote_txn) do
        BloomNetCenterClient::Txn.new(
          id: "TRACKNO",
          ref_no: "REFNO",
          tracking_no: "TRACKNO",
          status: "unfunded",
          account: "GDAC",
        )
      end

      it "updates the local txn" do
        expect(resulting_txn.external_id).to eq "TRACKNO"
        expect(resulting_txn.ref_no).to eq "REFNO"
        expect(resulting_txn.tracking_no).to eq "TRACKNO"
        expect(resulting_txn.status).to eq "funding"
        expect(resulting_txn.remote_status).to eq "unfunded"
        expect(resulting_txn.address).to eq "GDAC"
      end
    end

    context "create_txn_response is not successful" do
      let(:create_txn_response) do
        BloomNetCenterClient::CreateTxnResponse.new(success: false, body: "body")
      end

      it "marks the txn with `center_error` and fails the ctx" do
        expect(resulting_ctx).to be_failure
        expect(resulting_txn).to be_center_error
      end
    end

  end
end
