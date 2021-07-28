module PostsHelper

    def mint_embed_post post_params, feed
        @embed = Embed.new(post_params[:content])

        if @embed.success
            @post = Post.new 
            @post.post_type = 'embed'

            @post.content = @embed.html
            @post.provider_name = @embed.provider_name
            @post.author_name = @embed.author_name
            @post.author_url = @embed.author_url
            @post.title = "#{@embed.title} via #{@embed.provider_name}"
            @post.feed_id = post_params[:feed_id]

            @post.save
        elsif image?(post_params[:content])
            mint_image_post(post_params, feed)
        else
            mint_link_post(post_params, feed)
        end
    end


    def mint_text_post post_params, feed
        @post = Post.new post_params
        @post.post_type = 'text'

        @post.title = "Note by #{@current_user.name}"
        @post.provider_name = "interal"
        @post.feed_id = post_params[:feed_id]
        @post.save
    end 


    def mint_link_post post_params, feed
        require "ogpr"

        @title = post_params[:content]

        # https://github.com/hirakiuc/ogpr
        ogp = Ogpr.fetch(post_params[:content])
        if ogp.exist?
            if ogp.meta["og:description"]
                @title = ogp.meta["og:description"]
            end
        end

        @post = Post.new post_params
        @post.content = (("<a class='hey' href='#{post_params[:content]}'> #{@title} </a> "))
        @post.post_type = 'link'

        @post.title = "Link by #{@current_user.name}"
        @post.provider_name = "interal"
        @post.feed_id = post_params[:feed_id]
        @post.save
    end 


    def mint_image_post post_params, feed
        @post = Post.new post_params
        @post.post_type = 'image'
        @post.content =  "<img src='#{post_params[:content]}'>"
        @post.title = "Image by #{@current_user.name}"
        @post.provider_name = "interal"
        @post.feed_id = post_params[:feed_id]
        @post.save
    end

    
    def image?(url)
        response = HTTParty.get(url, { timeout: 4 })
        return response.content_type.start_with? 'image'
    end

end
