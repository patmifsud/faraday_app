class FeedsController < ApplicationController
  def new
  end

  def create
    @feed = Feed.create feed_params
    @feed.user_id = @current_user.id
    @feed.save
    redirect_to feed_path(@feed.slug)
  end

  def browse
     @all_feeds = Feed.all
  end

  def edit
  end

  def delete
  end

  def view
    @feed = Feed.find_by_slug(params[:slug])
    redirect_to root_path if @feed.nil? 
    
    @posts = @feed.posts.sort_by{ |item| item.id }
    if @current_user && @current_user.id == @feed.user_id
      @editor = true
    end
  end

  private
    def feed_params
      params.require(:feed).permit(:name, :user_id)
    end
end
