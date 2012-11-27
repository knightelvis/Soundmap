class CreateTags < ActiveRecord::Migration

  def change
    create_table(:tags, :primary_key =>'id') do |t|
      t.integer :id
      t.string :title
      t.integer :count

      t.timestamps
    end
  end
end
