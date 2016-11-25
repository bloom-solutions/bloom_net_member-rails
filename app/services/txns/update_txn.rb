module Txns
  class UpdateTxn

    extend LightService::Action
    expects :create_response

    executed do |c|
      parsed_body = JSON.parse(c.create_response.body).with_indifferent_access

      c.txn.update_attributes!(
        ref_no: parsed_body[:ref_no],
        status: parsed_body[:status],
      )
    end

  end
end
