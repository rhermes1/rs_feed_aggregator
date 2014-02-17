module TopicsHelper
  def set_topic
    @topic = Topic.find(params[:id])
    puts "-------------------------------"
    puts "-------------------------------"
    p @topic
    puts "-------------------------------"
    puts "-------------------------------"
  end
  def current_topic
    @current_topic = @topic 
  end
end
