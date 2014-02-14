require 'rss'
require 'open-uri'

class RssFeedsController < ApplicationController
  before_action :set_rss_feed, only: [:show, :edit, :update, :destroy]

  def index
    @rss_feeds = RssFeed.all
  end

  def show
  end

  def new
    @rss_feed = RssFeed.new #RSS::Parser.parse(RssFeed.new)
  end

  def edit
  end

  def create
    @rss_feed = RssFeed.new(rss_feed_params) #
    puts "--------------------------"
    puts "--------------------------"
    puts "--------------------------"
    @rss_link = RSS::Parser.parse(@rss_feed.content)
    p @rss_link
    puts "--------------------------"
    puts "--------------------------"
    puts "--------------------------"

    respond_to do |format|
      if @rss_feed.save
        format.html { redirect_to @rss_feed,
          notice: 'Rss feed was successfully created.' }
        format.json { render action: 'show', 
          status: :created, location: @rss_feed }
      else
        format.html { render action: 'new' }
        format.json { render json: @rss_feed.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rss_feed.update(rss_feed_params)
        format.html { redirect_to @rss_feed, notice: 'Rss feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rss_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rss_feed.destroy
    respond_to do |format|
      format.html { redirect_to rss_feeds_url }
      format.json { head :no_content }
    end
  end

  private
    def set_rss_feed
      @rss_feed = RssFeed.find(params[:id])
    end

    def rss_feed_params
      params.require(:rss_feed).permit(:content, :topic_id)
    end
end
