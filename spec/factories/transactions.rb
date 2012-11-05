# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    user_id 1
    item_id 1
    quantity 1
    cost 1
  end
end
