class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :contact
      t.string :address
      t.string :rating
      t.string :description

      t.timestamps
    end
  end
end
