class AddIndexToSoundTagRelations < ActiveRecord::Migration
  def change
    add_index :sound_tag_relations, :sound_id
    add_index :sound_tag_relations, :tag_id
    add_index :sound_tag_relations, [:sound_id, :tag_id], unique: true
  end
end
