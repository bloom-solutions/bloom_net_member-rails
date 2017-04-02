require 'rails_helper'

module Txns
  module Operation
    RSpec.describe Update, cleaning_strategy: :truncation do

      let!(:txn) { create(:txn, status: "fresh") }

      context "given a txn id" do
        it "updates a txn" do
          described_class.({
            "id" => txn.id,
            "txn" => { "status" => "funded" }
          })

          txn.reload

          expect(txn).to be_funded
          expect(Txns::Callback::AfterUpdateJob).to have_been_enqueued.with(txn)
        end
      end

      context "given a txn in the context" do
        it "updates the txn" do
          described_class.(
            { "txn" => { "status" => "funded" } },
            { "txn" => txn },
          )

          txn.reload

          expect(txn).to be_funded
          expect(Txns::Callback::AfterUpdateJob).to have_been_enqueued.with(txn)
        end
      end

    end
  end
end
