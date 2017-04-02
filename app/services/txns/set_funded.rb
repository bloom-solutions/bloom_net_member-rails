module Txns
  class SetFunded

    extend LightService::Action
    expects :txn

    executed do |c|
      Operation::Update.(
        { "txn" => {status: "fund_sent", remote_status: "funded"} },
        { "txn" => c.txn },
      )
    end

  end
end
