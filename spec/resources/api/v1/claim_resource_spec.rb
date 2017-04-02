require 'rails_helper'

module Api
  module V1
    RSpec.describe ClaimResource, type: :resource do

      let(:claim) { build_stubbed(:claim, ref_no: "JAKALA") }
      subject(:resource) { described_class.new(claim, {}) }

      it { is_expected.to have_primary_key(:ref_no) }
      it { is_expected.to have_attribute(:ref_no) }
      it { is_expected.to have_attribute(:status) }
      it { is_expected.to_not have_creatable_fields(:status) }

    end
  end
end
