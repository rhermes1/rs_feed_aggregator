class TopicsController < ApplicationController
  require 'rss/2.0'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @all_topic_rss_feeds = @topic.get_all_topic_rss
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    rss_save_status = build_rss(rss_params)
    if rss_save_status
      if @topic.save
        redirect_to @topic
      else
        render :action => 'new'
      end
    else
      render :action => 'edit' 
    end
  end

  def update
    @topic = Topic.find(params[:id])
    rss_save_status = build_rss(rss_params)
    if rss_save_status
      if @topic.update(topic_params)
        render :action => 'edit'
      else
        render :action => 'edit' 
      end
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
      rss_save = true
      rsses.each do |key, value|
        if value["_destroy"] == "1"
          @topic.rsses.find(value["id"]).destroy
        elsif value["link"].blank? 
          next
        elsif value.has_key?("id")
          rss = @topic.rsses.find(value["id"]) 
          rss.link = value["link"]
          rss.save
        else
           all_rss, same = @topic.rsses.all, 0
           all_rss.each do |rss|
             if rss.link == value[:link] 
               same = 1
             end
           end
           unless same == 1
             rss = @topic.rsses.new(value)
             rss_save = rss.save
           end
        end
      end
    end
end
