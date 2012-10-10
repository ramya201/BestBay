require 'spec_helper'

describe Category do
  describe "when name is not present" do
    before { @category.name = nil }
    it { should_not be_valid }
  end
end
