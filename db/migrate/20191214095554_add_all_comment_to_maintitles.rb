class AddAllCommentToMaintitles < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :all_comment, :integer
    add_column :maintitles, :new_story, :datetime
  end
end
