class RemoveIndexFromLike < ActiveRecord::Migration
  def up
    remove_index :likes, [:user_id, :sound_id]
  end

  def down
  end
end
