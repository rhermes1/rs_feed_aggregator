class Topic < ActiveRecord::Base
  has_many :rss_feeds
end
