# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    password "abcdef"
    first_name "Example First"
    last_name "Example Last"
    email "abcd@example.com"
  end

end
