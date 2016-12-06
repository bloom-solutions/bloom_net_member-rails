module Txns
  class SetFunded

    extend LightService::Action
    expects :txn

    executed do |c|
      c.txn.update_attributes!(status: "funded")
    end

  end
end
