require 'rails_helper'

module Claims
  RSpec.describe FetchRemoteTxn do

    let(:client) { BloomNetCenter::InitializeClient.execute.center_client }
    let(:claim) { build_stubbed(:claim, tracking_no: "TRACKNO") }
    let(:resulting_ctx) do
      described_class.execute(center_client: client, claim: claim)
    end

    context "remote txn of the claim exists" do
      let(:remote_txn) { BloomNetCenterClient::Txn.new(tracking_no: "TRACKNO") }
      let(:response) do
        BloomNetCenterClient::FindTxnResponse.new(txn: remote_txn)
      end

      it "fetches the remote txn of the claim" do
        expect(client).to receive(:find_txn).with("TRACKNO").
          and_return(response)

        expect(resulting_ctx.remote_txn.tracking_no).to eq claim.tracking_no
      end
    end

    context "remote txn of the claim does not exist" do
      let(:response) { BloomNetCenterClient::FindTxnResponse.new(txn: nil) }

      it "fetches the remote txn of the claim" do
        expect(client).to receive(:find_txn).with("TRACKNO").
          and_return(response)

        expect(resulting_ctx.remote_txn).to be_nil
      end
    end

  end
end
