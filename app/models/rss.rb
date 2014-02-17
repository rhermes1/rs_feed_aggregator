class Rss < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :link
end
