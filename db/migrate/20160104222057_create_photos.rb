class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :image_file

      t.timestamps null: false
    end
  end
end
