module FormHelper
  def setup_topic(topic)
    1.times { topic.rsses.build }
    topic
  end
end
