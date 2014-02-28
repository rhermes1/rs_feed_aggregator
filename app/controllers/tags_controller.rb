class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @sort_rss_topic_array = @tag.sort_topics_rss
  end
  
  def new
    @tag = Tag.new 
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to '/tags'
    else
      render :action => 'new'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
  end
  
  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
