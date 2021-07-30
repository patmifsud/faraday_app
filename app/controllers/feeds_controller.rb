class FeedsController < ApplicationController
  def new
  end

  def create
    @feed = Feed.create feed_params
    @feed.user_id = @current_user.id
    @feed.save
    # this bit was rushed minutes before submittion
    p5 = Post_factory.mint_embed_post("https://www.youtube.com/watch?v=uaaC57tcci0", @feed)
    p4 = Post_factory.mint_embed_post("https://twitter.com/Davesci/status/1315527920685703168", @feed)
    p3 = Post_factory.mint_text_post(" <h3>Faraday is a little tool to help you: </h3>   
      <h3>
          <ul>
              <li><span class='underline'>Quit a social network</span> while still keeping track of a couple key people, communities or channels</li>
              <li><span class='underline'>Hijack your habbits</span> - replace your twitter, youtube, reddit or instagram app with a feed of productive or motivational stuff</li>
              <li><span class='underline'>Spend less time on social media</span> - no algorythyms or endless feeds</li>
          </ul> 
      </h3>", @feed)
    p1 = Post_factory.mint_text_post("<h3>Welcome to your new feed 👋 </h3><br/> <h3>Paste in a link to the box above to get started.</h3>", @feed)
    
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
