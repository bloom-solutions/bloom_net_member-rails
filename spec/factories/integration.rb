FactoryGirl.define do

  factory :integration do
    callback_url "http://localhost/cb"
  end

end
