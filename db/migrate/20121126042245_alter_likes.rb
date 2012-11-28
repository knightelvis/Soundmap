class AlterLikes < ActiveRecord::Migration
  def up
    change_table :likes do |t|
      t.integer :favored_sound_id
    end
    remove_column :likes, :sound_id
  end

  def down
  end
end
