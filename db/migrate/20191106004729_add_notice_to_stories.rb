class AddNoticeToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :notice, :text
  end
end
