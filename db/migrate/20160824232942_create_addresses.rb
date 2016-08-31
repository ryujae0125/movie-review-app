class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
