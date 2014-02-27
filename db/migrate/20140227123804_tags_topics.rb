class TagsTopics < ActiveRecord::Migration
  def change
    create_join_table :tags, :topics do |t|
      t.index :tag_id
      t.index :topic_id
  
      t.timestamps
    end
  end
end
