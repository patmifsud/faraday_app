class PostsController < ApplicationController
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def delete
    end
  
    def create
        # check if post is empty
            # error - is empty
            # don't redirect
        
        # check is allowed to post
            # error - not allowed 
            # don't redirect

        #check if post is a url
            #make it a text post
            # don't redirect

        #oembed time








        if post_params[:content] == "" 
            redirect_back fallback_location: root_path  
            return
        end

        @feed = Feed.find(post_params[:feed_id])

        @hash = JSON.parse string




        if @current_user && @current_user.id == @feed.user_id
            @post = Post.new post_params
            if @post.save # returns true on success
                redirect_back fallback_location: root_path  
                return
            else # error message - failed please try again
                render html: "<script>alert('Creating a post didn't work, please try again')</script>".html_safe
                return
            end
        else
            # error message - no permission
            render html: "<script>alert('You shouldn't be able to make posts on this feed, you don't have permissions for it')</script>".html_safe
            return            
        end
    end

    private
        def post_params
        params.require(:post).permit(:content, :source, :title, :feed_id)
        end
  end
  