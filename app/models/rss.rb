# encoding: utf-8
class Rss < ActiveRecord::Base
  require 'rss/2.0'
  belongs_to :topic
  validates_presence_of :link
  validate :validate_link

  def parse_rss_hash(topic_rss_array)
    rss_feed = RSS::Parser.parse(self.link, false)
    unless rss_feed == nil
      rss_feed.items.each do |item|
          news_feed = {
               :title      => include_wrong_utf(item.title),
               :title_link => item.link,
               :contact    => include_wrong_utf(item.description),
               :date       => set_time(item.pubDate),
               :link       => self.link 
                   } 
        topic_rss_array << news_feed
      end
    else
       news_feed = {
                   :title   => "No Rss Feed Found",
                   :contact => "No Rss Feed Found",
                   :date    => Time.now,
                   :link    => self.link
                   }
      topic_rss_array << news_feed
    end
    return topic_rss_array.sort_by{ |hsh| hsh[:date] }.reverse
  end
 
  def encode_string(string)
     string = string.encode("iso-8859-1",
                {:invalid => :replace, :undef => :replace, :replace => ''})
                .force_encoding("UTF-8")
     return string
  end
  def include_wrong_utf(string)
    if string != nil
    invalid_string = ["Ã¼", "Ã¶", "Ã¤", "Â", "Ã"]
      if invalid_string.any? {|invalid| string.include? invalid } 
          string = encode_string(string) 
      end
    return string.html_safe
    end
  end
  def set_time(time)
    if time 
      return time 
    else
      return Time.now
    end
  end
  private
    def validate_link
      if !link.blank? && RSS::Parser.parse(link, false) == nil
        errors.add(:link, "is invalid")
      end
    end
end
