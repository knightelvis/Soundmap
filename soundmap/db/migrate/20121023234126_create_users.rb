class CreateUsers < ActiveRecord::Migration
  def change
    create_table (:users, :primary_key =>'id') do |t|
      t.integer :id
      t.string :username
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
