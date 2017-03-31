module Claims
  class WatchAddress

    extend LightService::Action

    executed do |c|
      StellarLookout::Watch.(Settings.bloom_net_address)
    end

  end
end
