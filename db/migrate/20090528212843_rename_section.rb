class RenameSection < ActiveRecord::Migration
  def self.up
    rename_column :projects, :section,  :section_id
  end

  def self.down
    rename_column :projects, :section_id,  :section
  end
end
