class ChangeSounds < ActiveRecord::Migration
  def up
    change_table :sounds do |t|
      t.change :longitude, :float
      t.change :latitude, :float
    end
  end

  def down
  end
end
