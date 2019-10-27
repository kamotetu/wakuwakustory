class AddMaintitleRefToStories < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :maintitle, foreign_key: true
  end
end
