class AddSectionToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :section, :integer
  end

  def self.down
    remove_column :projects, :section
  end
end
