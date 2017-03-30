require 'rails_helper'

module Txns
  RSpec.describe CreateRemoteTxn do

    let(:txn) do
      build_stubbed(:txn, {
        sender_first_name: "SenderFirstName",
        sender_last_name: "SenderLastName",
        sender_mobile: "SenderMobile",
        sender_street: "SenderStreet",
        sender_city: "SenderCity",
        sender_region: "SenderRegion",
        recipient_first_name: "RecipientFirstName",
        recipient_last_name: "RecipientLastName",
        recipient_mobile: "RecipientMobile",
        recipient_street: "RecipientStreet",
        recipient_city: "RecipientCity",
        recipient_region: "RecipientRegion",
        amount: 100,
      })
    end
    let(:client) { BloomNetCenterClient::Client.new }
    let(:response) { BloomNetCenterClient::CreateTxnResponse.new }
    let(:resulting_ctx) { described_class.execute(client: client, txn: txn) }

    it "creates a Txn in BloomNet Center" do
      expect(client).to receive(:create_txn).with(
        sender_first_name: "SenderFirstName",
        sender_last_name: "SenderLastName",
        sender_mobile: "SenderMobile",
        sender_street: "SenderStreet",
        sender_city: "SenderCity",
        sender_region: "SenderRegion",
        recipient_first_name: "RecipientFirstName",
        recipient_last_name: "RecipientLastName",
        recipient_mobile: "RecipientMobile",
        recipient_street: "RecipientStreet",
        recipient_city: "RecipientCity",
        recipient_region: "RecipientRegion",
        amount: 100,
      ).and_return(response)

      expect(resulting_ctx.create_txn_response).to eq response
    end

  end
end
