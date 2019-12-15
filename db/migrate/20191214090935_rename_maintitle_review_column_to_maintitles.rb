class RenameMaintitleReviewColumnToMaintitles < ActiveRecord::Migration[5.2]
  def change
    rename_column :maintitles, :maintitle_review, :all_review
    rename_column :maintitles, :maintitle_favorite, :all_favorite
  end
end
