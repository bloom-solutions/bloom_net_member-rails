module BloomNetCenter
  class InitializeClient

    extend LightService::Action
    promises :central_client

    executed do |c|
      c.central_client = BloomNetCenterClient.new
    end

  end
end
