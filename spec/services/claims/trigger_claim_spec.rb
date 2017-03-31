require 'rails_helper'

module Claims
  RSpec.describe TriggerClaim do

    let(:client) { BloomNetCenter::InitializeClient.execute.center_client }
    let(:response) { BloomNetCenterClient::CreateClaimResponse.new }
    let(:claim) { build_stubbed(:claim, ref_no: "JAKALA") }

    it "creates the claim on BloomNetCenter" do
      expect(client).to receive(:create_claim).with(
        ref_no: "JAKALA",
        account
      ).and_return(response)

      expect(claim).to receive(:claiming!)

      resulting_ctx = described_class.execute(
        center_client: client,
        claim: claim,
      )

      expect(resulting_ctx.create_claim_response).to eq response
    end

  end
end
