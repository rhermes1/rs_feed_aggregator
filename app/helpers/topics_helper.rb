module TopicsHelper
  def set_topic
    @topic = Topic.find(params[:id])
  end
  def current_topic
    @current_topic = @topic 
  end
end
