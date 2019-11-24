class AddStoryIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :story_id, :integer
  end
end
