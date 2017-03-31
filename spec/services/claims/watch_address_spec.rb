require 'rails_helper'

module Claims
  RSpec.describe WatchAddress do

    it "watches #{Settings.bloom_net_address}" do
      expect(StellarLookout::Watch).to receive(:call).
        with(Settings.bloom_net_address)
      described_class.execute
    end

  end
end
