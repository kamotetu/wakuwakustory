class AddMaintitleFavoriteToMaintitles < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :maintitle_favorite, :integer
  end
end
