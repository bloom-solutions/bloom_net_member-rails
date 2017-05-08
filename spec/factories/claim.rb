FactoryGirl.define do

  factory :claim do
    tracking_no { SecureRandom.hex(12).upcase }
  end

end
