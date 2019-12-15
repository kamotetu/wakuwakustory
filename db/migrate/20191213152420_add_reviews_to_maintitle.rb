class AddReviewsToMaintitle < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :review, :integer
  end
end
