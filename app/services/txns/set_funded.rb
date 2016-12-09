module Txns
  class SetFunded

    extend LightService::Action
    expects :txn

    executed do |c|
      c.txn.update_attributes!(remote_status: "funded")
    end

  end
end
