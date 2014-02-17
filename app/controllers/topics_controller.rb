class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    build_rss(rss_params)
    if @topic.save
      redirect_to @topic
    else
      render :action => 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])
    build_rss(rss_params)
    if @topic.update(topic_params)
      render :action => 'edit'
    else
      render :action => 'edit' 
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:topic, :rsses_attributes)
    end
    def rss_params
     rss_params = params[:topic][:rsses_attributes]
    end
    def build_rss(rsses)
      rsses.each do |key, value|
        if value["_destroy"] == "1"
          @topic.rsses.find(value["id"]).destroy
        elsif value["link"].blank? 
          next
        else
          rss = @topic.rsses.build(value)
          rss.save
        end
      end
    end
end
