FactoryGirl.define do

  factory :txn do
    sender_first_name "Jimmy"
    sender_last_name "Eat World"
    sender_mobile "+63919191919"
    recipient_first_name "Integrity"
    recipient_last_name "Azul"
    recipient_mobile "+6391571777777"
    recipient_street "Chance St"
    sequence(:ref_no) { |n| "LMU#{n}" }
  end

end
