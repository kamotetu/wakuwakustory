class AddUserIdToMaintitle < ActiveRecord::Migration[5.2]
  def change
    add_reference :maintitles, :user, foreign_key: true
  end
end
