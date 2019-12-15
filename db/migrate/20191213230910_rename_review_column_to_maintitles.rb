class RenameReviewColumnToMaintitles < ActiveRecord::Migration[5.2]
  def change
    rename_column :maintitles, :review, :maintitle_review
  end
end
