module Txns
  class WatchAddress

    extend LightService::Action
    expects :txn

    executed do |c|
      StellarLookout::Watch.(c.txn.address)
    end

  end
end
