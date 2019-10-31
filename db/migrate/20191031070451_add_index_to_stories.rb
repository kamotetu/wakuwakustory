class AddIndexToStories < ActiveRecord::Migration[5.2]
  def change
    add_index :stories, :title
  end
end
