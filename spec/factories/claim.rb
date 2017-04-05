FactoryGirl.define do

  factory :claim do
    ref_no { SecureRandom.hex(12).upcase }
  end

end
