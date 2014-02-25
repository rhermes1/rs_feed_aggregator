class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic
      t.text :all_rss

      t.timestamps
    end
  end
end
