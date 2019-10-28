class AddExplanationToMaintitles < ActiveRecord::Migration[5.2]
  def change
    add_column :maintitles, :explanation, :text
  end
end
