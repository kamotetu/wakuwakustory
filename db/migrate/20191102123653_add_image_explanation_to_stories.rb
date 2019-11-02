class AddImageExplanationToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :image_explanation, :string
  end
end
