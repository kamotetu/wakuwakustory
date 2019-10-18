class AtoryTagsdestroy < ActiveRecord::Migration[5.2]
  def change
    drop_table :story_tags
  end
end
