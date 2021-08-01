module Post_factory

    # Takes in a string or url and outputs a Post object 

    # Make a new post obj from the url the user entered as :content
    def self.mint_embed_post content, feed
        @embed = Embed.new(content)
        # Does noembed know how to embed this url?
        if @embed.success
            # If yes lets embed as an iframe
            @post = Post.new 
            @post.post_type = 'embed'
            #--------------------------
            @post.content = @embed.html
            @post.provider_name = @embed.provider_name
            @post.author_name = @embed.author_name
            @post.author_url = @embed.author_url
            @post.title = "#{@embed.title.truncate(35)} via #{@embed.provider_name.truncate(35)}"
            @post.feed_id = feed.id
            @post.save
        elsif image?(content)
            # If it's an image theres another method to handle that
            mint_image_post(content, feed)
        else
            # Otherwise let's just link to it with it's open graph title
            mint_link_post(content, feed)
        end
    end


    # If it's just plain text postcontroller will call this method instead
    def self.mint_text_post content, feed
        @post = Post.new 
        @post.post_type = 'text'
        #--------------------------
        @post.content = content
        @post.title = "Note"
        @post.provider_name = "interal"
        @post.feed_id = feed.id
        @post.save
    end 

    # link
    def self.mint_link_post content, feed
        require "ogpr"
        # ^ Getting the Open Graph Desc for the link text 
        link_inner = content.truncate(35)        

        # https://github.com/hirakiuc/ogpr
        ogp = Ogpr.fetch(content) rescue nil

        # render some open graph stuff in the post depending on what is available
        if ogp
            link_inner = ogp.meta["og:description"].truncate(35) if ogp.meta["og:description"]
            link_inner = ogp.meta["og:title"].truncate(35) if ogp.meta["og:title"]  #title is better if available
            link_inner += (" - " + ogp.meta["og:site_name"]) if ogp.meta["og:site_name"]
            if ogp.meta["og:image"]
                mint_link_image_post(content, feed, ogp.meta["og:image"], link_inner)
                return
            end
        end

        @post = Post.new
        #--------------------------
        @post.content = (("<a href='#{content}'> #{link_inner} </a> ").html_safe)
        @post.post_type = 'link'
        @post.title = (("<a href='#{content}'> Link: #{link_inner} </a> ").html_safe)
        @post.provider_name = "interal"
        @post.feed_id = feed.id
        @post.save
    end 

    # image
    def self.mint_image_post content, feed
        @post = Post.new 
        #--------------------------
        @post.post_type = 'image'
        @post.content =  "<img src='#{content}'>"
        @post.title = "Image"
        @post.provider_name = "interal"
        @post.feed_id = feed.id
        @post.save
    end

    # image - but with a link 
    def self.mint_link_image_post content, feed, imgsrc, og_str
        @post = Post.new 
        #--------------------------
        @post.post_type = 'image'
        @post.content =  "<img src='#{imgsrc}'>"
        @post.title = (("<a href='#{content}'> Link: #{og_str.html_safe} </a> ").html_safe)
        @post.provider_name = "interal"
        @post.feed_id = feed.id
        @post.save
    end




    

    # method to determine if link is an image
    def self.image?(url)
        response = HTTParty.get(url, { timeout: 5 })
        if !response == nil
            return response.content_type.start_with? 'image'
        else false
        end
    end
end