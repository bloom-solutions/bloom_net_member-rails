require 'rails_helper'

module Txns
  module Operation
    RSpec.describe Create, cleaning_strategy: :truncation do

      let(:current_user) { create(:user) }

      it "creates a txn" do
        result = described_class.(
          {
            "txn" => {
              "sender_first_name" => "Jimmy",
              "sender_last_name" => "Eat World",
              "sender_mobile" => "+63919191919",
              "recipient_first_name" => "Integrity",
              "recipient_last_name" => "Azul",
              "recipient_mobile" => "+6391571777777",
              "recipient_street" => "Chance St",
            }
          },
          {"current_user" => current_user},
        )

        txn = result["model"]
        expect(txn).to be_persisted
        expect(txn.recipient_first_name).to eq "Integrity"

        expect(Txns::Callback::AfterCreateJob).to have_been_enqueued.with(txn)
      end

    end
  end
end
