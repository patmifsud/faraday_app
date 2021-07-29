class PostsController < ApplicationController
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def destroy
        post = Post.find params[:id]
        if post.feed.user_id == @current_user.id
            post.destroy
            redirect_back fallback_location: root_path  
            return
        end
        redirect_back fallback_location: root_path  
    end
  

    def create
        @feed = Feed.find(post_params[:feed_id])

        # check if post is empty
        if post_params[:content].blank? 
            redirect_back fallback_location: root_path  
            #TODO add post is blank error
            return
        end

        # check if user is logged in and allowed to post to this feed
        if !@current_user || @current_user.id != @feed.user_id 
            #TODO add permissions error
            return 
        end

        #Is the post plain text or a URL? 
        if !url?(post_params[:content]) 
             Post_factory.mint_text_post(post_params[:content], @feed) 
        else Post_factory.mint_embed_post(post_params[:content], @feed)
        end

        redirect_back fallback_location: root_path  
    end

    private
        def post_params
            params.require(:post).permit(:content, :source, :title, :feed_id)
        end
end
  