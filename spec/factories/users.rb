# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username ""
    password ""
    first_name ""
    last_name ""
    email ""
    image ""
  end
end
