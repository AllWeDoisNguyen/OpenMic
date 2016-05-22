class AddShowIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :show_id, :string
  end
end
