class AddGenreToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :genre, :integer, null: false
  end
end
