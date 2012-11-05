class CreateSounds < ActiveRecord::Migration
  def change
    create_table(:sounds, :primary_key =>'id') do |t|
      t.integer :id
      t.string :title
      t.text :description
      t.string :location
      t.string :path
      t.string :user_id

      t.timestamps
    end
  end
end
