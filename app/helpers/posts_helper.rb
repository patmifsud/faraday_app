module PostsHelper

    def mint_text_post post_params, feed
        @post = Post.new post_params
        @post.post_type = 'text'

        @post.title = "Note by #{@current_user.name}"
        @post.provider_name = "interal"
        @post.feed_id = post_params[:feed_id]
        @post.save
    end 

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
        else 
            mint_text_post(post_params, feed)
        end
    end

end
