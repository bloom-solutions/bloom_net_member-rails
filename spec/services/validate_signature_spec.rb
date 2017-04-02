require 'rails_helper'

RSpec.describe ValidateSignature do

  let(:secret) { SecureRandom.hex(64) }
  let(:body) { {some: "json"}.to_json }
  let(:expected_signature) { OpenSSL::HMAC.hexdigest("SHA256", secret, body) }
  subject do
    described_class.({
      secret: secret,
      signature: signature,
      body: body,
    })
  end

  context "received signature does not match" do
    let(:signature) { OpenSSL::HMAC.hexdigest("SHA256", "fake", body) }
    it { is_expected.to be false }
  end

  context "received signature matches" do
    let(:signature) { OpenSSL::HMAC.hexdigest("SHA256", secret, body) }
    it { is_expected.to be true }
  end

end
