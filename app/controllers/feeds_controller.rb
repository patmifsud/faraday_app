class FeedsController < ApplicationController
  def new
  end

  def create
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
end
