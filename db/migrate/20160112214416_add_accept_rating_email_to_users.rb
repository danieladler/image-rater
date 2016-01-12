class AddAcceptRatingEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accept_rating_email, :boolean
  end
end
