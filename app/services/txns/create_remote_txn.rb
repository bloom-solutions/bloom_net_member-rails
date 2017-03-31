module Txns
  class CreateRemoteTxn

    extend LightService::Action
    expects :center_client, :txn
    promises :create_txn_response

    ATTRS = %i[
      sender_first_name
      sender_last_name
      sender_mobile
      sender_street
      sender_city
      sender_region
      recipient_first_name
      recipient_last_name
      recipient_mobile
      recipient_street
      recipient_city
      recipient_region
      amount
      currency
    ]

    executed do |c|
      txn = c.txn
      attrs = ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = txn.send(attr)
      end
      attrs[:currency] = attrs[:currency].upcase
      c.create_txn_response = c.center_client.create_txn(attrs)
    end

  end
end
