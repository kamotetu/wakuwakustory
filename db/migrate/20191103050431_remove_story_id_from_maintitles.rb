class RemoveStoryIdFromMaintitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :maintitles, :story_id, :integer
  end
end
