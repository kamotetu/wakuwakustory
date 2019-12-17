class AddAllStoryToMaintitles < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :all_story, :integer
  end
end
