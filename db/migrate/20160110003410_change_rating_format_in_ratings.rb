class ChangeRatingFormatInRatings < ActiveRecord::Migration
  def change
    change_column :ratings, :rating, 'integer USING rating::integer'
  end

end
