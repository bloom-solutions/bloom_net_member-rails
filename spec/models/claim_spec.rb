require 'rails_helper'

RSpec.describe Claim do

  describe ".created_at_or_after" do
    let(:time_0) { Time.parse("2016-01-01 12:31:04") }
    let(:time_1) { Time.parse("2016-01-01 12:31:05") }
    let(:time_2) { Time.parse("2016-01-01 12:31:06") }
    let!(:claim_1) { create(:claim, created_at: time_1) }
    let!(:claim_2) { create(:claim, created_at: time_2) }

    it "returns claims created at or after the given time" do
      expect(described_class.created_at_or_after(time_0)).
        to match_array([claim_1, claim_2])

      expect(described_class.created_at_or_after(time_1)).
        to match_array([claim_1, claim_2])

      expect(described_class.created_at_or_after(time_2)).
        to match_array([claim_2])
    end
  end

  describe ".created_at_or_before" do
    let(:time_0) { Time.parse("2016-01-01 12:31:04") }
    let(:time_1) { Time.parse("2016-01-01 12:31:05") }
    let(:time_2) { Time.parse("2016-01-01 12:31:06") }
    let!(:claim_1) { create(:claim, created_at: time_1) }
    let!(:claim_2) { create(:claim, created_at: time_2) }

    it "returns claims created at or before the given time" do
      expect(described_class.created_at_or_before(time_0)).to be_empty

      expect(described_class.created_at_or_before(time_1)).
        to match_array([claim_1])

      expect(described_class.created_at_or_before(time_2)).
        to match_array([claim_1, claim_2])
    end
  end

end
