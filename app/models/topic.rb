class Topic < ActiveRecord::Base
  validates :topic, presence: true, uniqueness: true
  has_many :rsses

  accepts_nested_attributes_for :rsses,
    :allow_destroy => true,
    :reject_if     => lambda { |a| a[:content].blank? } 
end
