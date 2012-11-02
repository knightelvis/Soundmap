class CreateSounds < ActiveRecord::Migration
  def change
    create_table(:sounds, :primary_key =>'id') do |t|
      t.integer :id
      t.string :title
      t.text :description
      t.string :location
      t.string :path
      t.string :username

      t.timestamps
    end
  end
end
