module StellarBridge
  class InitializeClient

    extend LightService::Action
    promises :bridge_client

    executed do |c|
      c.bridge_client = BridgeClient.new
    end

  end
end
