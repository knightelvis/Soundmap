class AlterIndexForLike < ActiveRecord::Migration
  def up
    add_index :likes, :favored_sound_id
    add_index :likes, [:user_id, :favored_sound_id], unique: true
  end

  def down
  end
end
