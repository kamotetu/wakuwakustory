class RenameImageExplanationColumnToStories < ActiveRecord::Migration[5.2]
  def change
    rename_column :stories, :image_explanation, :synopsis
  end
end
