class AddIndexes < ActiveRecord::Migration
=begin
  def up
    add_index :brands, :name, unique: true
    add_index :categories, :name, unique: true
    add_index :subcategories, :name, unique: true
  end
=end

  def change
    add_index :brands, :name, unique: true
    add_index :categories, :name, unique: true
    add_index :subcategories, :name, unique: true
  end

=begin
  def down
    remove_index :brands, :name
    remove_index :categories, :name
    remove_index :subcategories, :name
  end
=end
end
