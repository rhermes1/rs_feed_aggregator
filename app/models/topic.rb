class Topic < ActiveRecord::Base
  serialize :all_rss, Array
  validates :topic, presence: true, uniqueness: true
  has_many :rsses

  accepts_nested_attributes_for :rsses,
    :allow_destroy => true,
    :reject_if     => lambda { |a| a[:content].blank? } 

  def get_all_topic_rss
    all_topic_rss_feeds = []
    self.rsses.each do |rss_feed|
      all_topic_rss_feeds = rss_feed.parse_rss_hash(all_topic_rss_feeds)
    end
    return all_topic_rss_feeds
  end
end
