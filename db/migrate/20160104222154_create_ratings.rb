class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :photo_id
      t.string :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
