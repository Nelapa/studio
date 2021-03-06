class AddThumbToUsers < ActiveRecord::Migration
  def self.up
   add_column :users, :thumb_file_name, :string
    add_column :users, :thumb_content_type, :string
    add_column :users, :thumb_file_size, :integer
  end
 
  def self.down
    remove_column :users, :thumb_file_name
    remove_column :users, :thumb_content_type
    remove_column :users, :thumb_file_size
  end
end
