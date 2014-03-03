class Topic < ActiveRecord::Base
  serialize :all_rss, Array
  attr_reader :tag_tokens

  validates :topic, presence: true, uniqueness: true

  has_many :rsses
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :rsses,
    :allow_destroy => true,
    :reject_if     => lambda { |a| a[:content].blank? } 

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")  
  end

  def get_all_topic_rss
    all_topic_rss_feeds = []
    self.rsses.each do |rss_feed|
      all_topic_rss_feeds = rss_feed.parse_rss_hash(all_topic_rss_feeds)
    end
    self.all_rss = all_topic_rss_feeds
    self.save
    return all_topic_rss_feeds
  end

  def self.search(search_values)
    return [] if search_values.blank?
    post_arel_table = self.arel_table
    self.where(
      post_arel_table[:topic].matches("%#{search_values}%").or(
      post_arel_table[:all_rss].matches("%#{search_values}%"))).
      order("#{table_name}.created_at desc")
  end
end
