class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.string :content
      t.integer :topic_id

      t.timestamps
    end
  end
end
