class AddComedianIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :comedian_id, :integer
  end
end
