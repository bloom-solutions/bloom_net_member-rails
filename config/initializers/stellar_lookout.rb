StellarLookout.configure do |c|
  c.server_url = Settings.stellar_lookout_url
  c.on_receive = "ProcessStellarOperation"
end
