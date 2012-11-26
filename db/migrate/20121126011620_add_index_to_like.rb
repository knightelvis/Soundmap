class AddIndexToLike < ActiveRecord::Migration
  def change
    add_index :likes, :user_id
    add_index :likes, :sound_id
    add_index :likes, [:user_id, :sound_id], unique: true
  end
end
