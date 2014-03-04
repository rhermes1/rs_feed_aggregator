class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @sort_rss_topic_array = @tag.sort_topics_rss
  end

  def index
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|  
      format.html  
      format.json { render :json => @tags.map(&:attributes) }  
    end  
  end

  def new
    @tag = Tag.new 
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to '/tags/new'
    else
      render :action => 'new'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to '/tags/new'
  end
 
  private
    def tag_params
      params.require(:tag).permit(:name, :description)
    end
end
