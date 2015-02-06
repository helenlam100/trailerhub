class AddTrailerIdColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :trailer_id, :integer
  end
end
