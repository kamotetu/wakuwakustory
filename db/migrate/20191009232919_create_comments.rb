class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.string :comment
      t.integer :user_id, null: false, foreign_key: true
      t.integer :story_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
