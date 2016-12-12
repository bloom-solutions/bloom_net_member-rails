module BloomNetCentral
  class InitializeClient

    extend LightService::Action
    promises :central_client

    executed do |c|
      c.central_client = BloomNetCentralClient.new
    end

  end
end
