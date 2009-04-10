class AddAuthorIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :author_id, :integer
  end

  def self.down
    remove_column :projects, :author_id
  end
end
