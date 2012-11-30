require 'spec_helper'

describe CategoriesController do

	before(:each) do
		@IS1=FactoryGirl.create(:IS1)
		@IS2=FactoryGirl.create(:IS2)
		@A1=FactoryGirl.create(:A1)
		@A2=FactoryGirl.create(:A2)
	end

	context "should not show item with 0 quantity or has ended" do
		it "when retrieve all items" do
			get :index
			assigns[:items].should include(@IS1)
			assigns[:items].should include(@A1)
			assigns[:items].should_not include(@IS2)
			assigns[:items].should_not include(@A6)
		end
		it "when search for items" do
			get :index, search: 'is1'
			assigns[:items].should include(@IS1)
			assigns[:items].should_not include(@A1)
			assigns[:items].should_not include(@IS2)
			assigns[:items].should_not include(@A2)
		end
		it "when retrieve items of specific subcategory" do
			get :index, {category_id: '1', subcategory_id: '1'}
			assigns[:items].should include(@IS1)
			assigns[:items].should include(@A1)
			assigns[:items].should_not include(@IS2)
			assigns[:items].should_not include(@A2)
		end
	end

end
