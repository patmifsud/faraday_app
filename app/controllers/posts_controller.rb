class PostsController < ApplicationController
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def delete
    end
  
    def create

        @feed = Feed.find(post_params[:feed_id])

        # ERRORS
        # check if post is empty
        if post_params[:content].blank? 
            redirect_back fallback_location: root_path  
            #TODO add post is blank error
            logger.debug "Content was blank"
            return
        end

        # check if user is logged in and allowed to post to this feed
        if !@current_user || @current_user.id != @feed.user_id 
            #TODO add permissions error
            logger.debug "You aren't logged in or don't have permission to post in this feed"
            return 
        end

        # TEXT
        #check if post is just text
        if !url?(post_params[:content]) 
            @post = Post.new post_params
            @post.title = "Note by #{@current_user.name}"
            @post.feed_id = post_params[:feed_id]
            @post.save
            logger.debug "Made post, returning as text"
            redirect_back fallback_location: root_path 
            return 
        end

        # URL TO BE EMBEDED
        @embed = Embed.new(post_params[:content])

        if @embed.success
            @post = Post.new 
            @post.content = @embed.html
            @post.title = "#{@embed.title} via #{@embed.website}"
            @post.feed_id = post_params[:feed_id]
            @post.save
            raise "d"
            redirect_back fallback_location: root_path  
        else 
            # make new text post
            @post = Post.new 
            @post.content = post_params[:content]
            @post.title = "Note by #{@current_user.name}"
            @post.feed_id = post_params[:feed_id]
            @post.save
            logger.debug "Made post, returning as text"
            redirect_back fallback_location: root_path 
            return 
        end



        # get noembed

        # if @post.save # returns true on success
        #     if url?(@post.content) 
        #         puts "YERSEYESESYSDGDFGSDFGSDFGSDFGDSFGSDFGSDFGSDFG" 
        #     end
        #     redirect_back fallback_location: root_path  
        #     return
        # else # error message - failed please try again
        #     render html: "<script>alert('Creating a post didn't work, please try again')</script>".html_safe
        #     return
        # end
             
    end




    private
        def post_params
        params.require(:post).permit(:content, :source, :title, :feed_id)
        end
end
  