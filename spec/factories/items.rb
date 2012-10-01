# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name ""
    description ""
    image ""
    start_price 1
    instant_price 1
    quantity 1
    sale_type ""
    start_time "2012-10-01 02:16:12"
    end_time "2012-10-01 02:16:12"
    user_id 1
    brand_id 1
    category_id 1
    subcategory_id 1
  end
end
