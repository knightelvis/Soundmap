class CreateRTagSounds < ActiveRecord::Migration
  def change
    create_table :r_tag_sounds do |t|
      t.integer :id
      t.integer :tag_id
      t.integer :sound_id

      t.timestamps
    end
  end
end
