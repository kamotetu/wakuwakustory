class AddGenreToMaintitles < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :genre, :integer, null: false
  end
end
