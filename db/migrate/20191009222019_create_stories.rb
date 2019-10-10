class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|

      t.string :title, null: false
      t.text :story, null: false
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
