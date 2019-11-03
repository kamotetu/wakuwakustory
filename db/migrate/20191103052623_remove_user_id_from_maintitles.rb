class RemoveUserIdFromMaintitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :maintitles, :user_id, :integer
  end
end
