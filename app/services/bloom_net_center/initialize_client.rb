module BloomNetCenter
  class InitializeClient

    extend LightService::Action
    promises :center_client

    executed do |c|
      c.center_client = BloomNetCenterClient.new
    end

  end
end
