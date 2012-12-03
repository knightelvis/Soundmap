class AlterTags < ActiveRecord::Migration
  def up
    remove_column :tags, :titile
    add_column :tags, :title, :string
  end

  def down
  end
end
