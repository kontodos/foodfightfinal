class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.datetime :posted_on
      t.text :content
      t.integer :user_id
      t.integer :food_id

      t.timestamps
    end
  end
end
