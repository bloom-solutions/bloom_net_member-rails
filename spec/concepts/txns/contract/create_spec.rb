require 'rails_helper'

module Txns
  module Contract
    RSpec.describe Create do

      describe "properties" do
        %i[
          sender_first_name
          sender_last_name
          sender_mobile
          sender_street
          sender_city
          sender_region
          recipient_first_name
          recipient_last_name
          recipient_mobile
          recipient_street
          recipient_city
          recipient_region
          amount
        ].each do |property|
          let(:contract) { described_class.new(Txn.new) }

          it "has the property #{property}" do
            contract.send(:"#{property}=", "value")
            expect(contract.send(property)).to eq "value"
          end
        end
      end

    end
  end
end
