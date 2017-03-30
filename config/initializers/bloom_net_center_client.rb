BloomNetCenterClient.configure do |c|
  c.host = Settings.bloom_net_center.host
  c.token = Settings.bloom_net_center.token
  c.secret = Settings.bloom_net_center.secret
end
