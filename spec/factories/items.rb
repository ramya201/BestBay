# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    factory :item do
        name "Camera"
        description ""
        price 1
        quantity 1
        sale_type ""
        start_time "2012-10-01 02:16:12"
        end_time "2012-10-01 02:16:12"
        user_id 1
        brand_id 1
        category_id 1
        subcategory_id 1
    end

    factory :IS1, parent: :item do
        name 'IS1'
        description 'this is IS1'
        price '100'
        quantity '10'
        sale_type 'IS'
        start_time ''
        end_time ''
        user_id '1'
        brand_id '1'
        category_id '1'
        subcategory_id '1'
    end

    factory :IS2, parent: :item do
        name 'IS2'
        description 'this is IS2'
        price '100'
        quantity '0'
        sale_type 'IS'
        start_time ''
        end_time ''
        user_id '1'
        brand_id '1'
        category_id '1'
        subcategory_id '2'
    end

    factory :A1 , parent: :item do
        name 'A1'
        description 'this is A1'
        price ''
        quantity '1'
        sale_type 'A'
        start_time '2012-11-01 00:00:00.0'
        end_time '2012-12-31 00:00:00.0'
        user_id '1'
        brand_id '1'
        category_id '1'
        subcategory_id '1'
    end

    factory :A2, parent: :item do
        name 'A2'
        description 'this is A2'
        price ''
        quantity '1'
        sale_type 'Auction'
        start_time '2012-11-01 00:00:00.0'
        end_time '2012-12-15 00:00:00.0'
        user_id '1'
        brand_id '1'
        category_id '1'
        subcategory_id '2'
    end

    factory :A6, parent: :item do
      name 'A6'
      description 'this is A6'
      price ''
      quantity '0'
      sale_type 'Auction'
      start_time '2012-11-01 00:00:00.0'
      end_time '2012-12-15 00:00:00.0'
      user_id '1'
      brand_id '1'
      category_id '1'
      subcategory_id '2'
    end

    factory :A3, parent: :item do
      name 'A3'
      description 'this is A2'
      price ''
      quantity '1'
      sale_type 'Auction'
      start_time '2012-11-01 00:00:00.0'
      end_time '2012-11-05 00:00:00.0'
      user_id '1'
      brand_id '1'
      category_id '1'
      subcategory_id '2'
    end

end
