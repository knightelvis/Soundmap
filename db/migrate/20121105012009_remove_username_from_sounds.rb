class RemoveUsernameFromSounds < ActiveRecord::Migration
  def up
    remove_column :sounds, :username
  end

  def down
  end
end
