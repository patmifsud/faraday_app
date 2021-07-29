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
    @feed = Feed.find_by_slug(params[:slug])
  end

  def update
    @feed = Feed.find_by_slug(params[:slug])
      if @feed.user_id == @current_user.id
        @feed.update feed_params
      end
      redirect_to user_home_path(@current_user)
  end

  def destroy
    feed = Feed.find_by_slug(params[:slug])
    feed.destroy if feed.user_id == @current_user.id
    redirect_to user_home_path(@current_user)
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
