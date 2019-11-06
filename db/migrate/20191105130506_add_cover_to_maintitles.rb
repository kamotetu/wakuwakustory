class AddCoverToMaintitles < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :cover, :string
  end
end
