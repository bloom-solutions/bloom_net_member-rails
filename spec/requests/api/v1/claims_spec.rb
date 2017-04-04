require 'rails_helper'

RSpec.describe "Api::V1::ClaimsController" do

  describe "POST /" do
    context("signature matches a valid API token", {
      vcr: {record: :once, match_requests_on: [:method]}
    }) do
      let!(:api_token) do
        create(:api_token, token: "token", secret: "secret")
      end

      let(:body) do
        {
          data: {
            type: "claims",
            attributes: {
              "ref-no" => "KUMALALA",
            }
          }
        }
      end
      let(:signature) {OpenSSL::HMAC.hexdigest("SHA256", "secret", body.to_json)}

      it "creates a claim", cleaning_strategy: :truncation do
        jsonapi_post("/api/v1/claims", {
          params: body,
          headers: { Authorization: "HMAC-SHA256 token:#{signature}" },
        })

        expect(response).to be_success
        response_body = JSON.parse(response.body)

        data = response_body["data"]

        attributes = data["attributes"]
        expect(attributes["ref-no"]).to eq "KUMALALA"
        expect(attributes["status"]).to eq "fresh"

        resulting_claim = Claim.find_by(ref_no: "KUMALALA")

        expect(Claims::Callback::AfterCreateJob).to have_been_enqueued.
          with(resulting_claim)
      end
    end

    context "signature does not match token" do
      let!(:api_token) do
        create(:api_token, token: "token", secret: "secret")
      end
      let(:body) do
        {
          data: {
            type: "claims",
            attributes: {
              "ref-no" => "KALALA",
            }
          }
        }
      end
      let(:signature) {OpenSSL::HMAC.hexdigest("SHA256", "boo", body.to_json)}

      it "responds with 401" do
        jsonapi_post("/api/v1/claims", {
          params: body,
          headers: { Authorization: "HMAC-SHA256 token:#{signature}" },
        })

        expect(response.status).to eq 401
      end
    end
  end

end
