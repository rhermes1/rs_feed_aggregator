class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates_length_of :description, :maximum => 255
  has_and_belongs_to_many :topics

  def sort_topics_rss
    sort_rss_topic_array = []
    self.topics.each do |topic|
      topic.get_all_topic_rss.each do |rss|
        sort_rss_topic_array << rss
      end
    end
    return sort_rss_topic_array.sort_by{ |hsh| hsh[:date] }.reverse
  end
end
