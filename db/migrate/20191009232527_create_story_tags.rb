class CreateStoryTags < ActiveRecord::Migration[5.2]
  def change
    create_table :story_tags do |t|

      t.integer :story_id, foreign_key: true
      t.integer :tag_id, foreign_key: true

      t.timestamps
    end
  end
end
