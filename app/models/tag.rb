class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :topics

  def sort_topics_rss
    sort_rss_topic_array = []
    self.topics.each do |topic|
      topic.all_rss.each do |rss|
        sort_rss_topic_array << rss
      end
    end
    return sort_rss_topic_array.sort_by{ |hsh| hsh[:date] }.reverse
  end
end
