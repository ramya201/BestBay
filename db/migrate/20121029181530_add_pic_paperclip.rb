class AddPicPaperclip < ActiveRecord::Migration
  def self.up
    add_column :items, :pic_file_name, :string
    add_column :items, :pic_content_type, :string
    add_column :items, :pic_file_size, :integer
  end

  def self.down
    remove_column :items, :pic_file_name
    remove_column :items, :pic_content_type
    remove_column :items, :pic_file_size
  end
end
