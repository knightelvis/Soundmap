class CreateSoundTagRelations < ActiveRecord::Migration
  def change
    create_table :sound_tag_relations do |t|
      t.integer :sound_id
      t.integer :tag_id

      t.timestamps

    end
  end
end
