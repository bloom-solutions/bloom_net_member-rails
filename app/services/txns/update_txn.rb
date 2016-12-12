module Txns
  class UpdateTxn

    extend LightService::Action
    expects :create_response

    executed do |c|
      parsed_body = JSON.parse(c.create_response.body).with_indifferent_access

      c.txn.update_attributes!(
        external_id: parsed_body[:data][:id],
        ref_no: parsed_body[:data][:ref_no],
        status: "funding",
        remote_status: parsed_body[:data][:status],
      )
    end

  end
end
