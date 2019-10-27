class CreateMaintitles < ActiveRecord::Migration[5.2]
  def change
    create_table :maintitles do |t|
      t.string :maintitle
      t.integer :story_id
      

      t.timestamps
    end
  end
end
