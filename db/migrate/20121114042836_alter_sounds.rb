class AlterSounds < ActiveRecord::Migration
  def up
    change_table :sounds do |t|
      t.string :latitude
      t.string :longitude
    end
  end

  def down
  end
end
