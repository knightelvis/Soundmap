class CreateRTagSounds < ActiveRecord::Migration

  def change
    create_table(:r_tag_sounds,:primary_key =>'id') do |t|
      t.integer :id
      t.integer :tag_id
      t.string :tag_title
      t.integer :sound_id

      t.timestamps
    end
  end
end
