
puts "Seeding Db..."

# SEED BUILDERS
@post_demo_content = ["What a great day for a walk", "Life is like a box" ]
@post_incr = 1

def mint_text_post(
    parent_feed, 
    content = @post_demo_content.sample, 
    i = @post_incr)
        i += 1
        @post = Post.new 
        @post.content = content
        @post.post_type = 'text'

        @post.title = "Note"
        @post.provider_name = "interal"
        @post.feed_id = parent_feed.id
        @post.save

        return @post
end 


def mint_embed_post (
    parent_feed, 
    content = "https://www.youtube.com/watch?v=jNQXAC9IVRw", 
    i = @post_incr)

    @embed = Embed.new(content)

    if @embed.success
        @post = Post.new 
        @post.post_type = 'embed'

        @post.content = @embed.html
        @post.provider_name = @embed.provider_name
        @post.author_name = @embed.author_name
        @post.author_url = @embed.author_url
        @post.title = "#{@embed.title} via #{@embed.provider_name}"
        @post.feed_id = parent_feed.id
        @post.save
        return @post
    else 
        mint_text_post(parent_feed, content)
    end
end




# CLEAR
User.destroy_all
Feed.destroy_all
Post.destroy_all


# MAKE USERS
u1 = User.create :email => 'sarah@test.acc', :name => 'Sarah', :password => 'chicken'
u2 = User.create :email => 'harris@test.acc', :name => 'Harris', :password => 'chicken'
u3 = User.create :email => 'pers@test.acc', :name => 'Pers', :password => 'chicken'
u4 = User.create :email => 'empty@test.acc', :name => 'Empty', :password => 'chicken'

puts "Seeded #{ User.count } users"

# MAKE FEEDS AND POSTS
f1 = Feed.create :name => 'Photography study'
u1.feeds << f1
    p1 = mint_embed_post(f1, "https://photoshootgoals.com/wp-content/uploads/2020/10/manual-photography-cheat-sheet-photo-shoot-goals.jpg")
    p2 = mint_embed_post(f1, "https://d3i71xaburhd42.cloudfront.net/a7401db2d9c664bb5500e79e7a5d9d97f6829711/3-Figure1-1.png")
    p3 = mint_embed_post(f1, "https://ars.els-cdn.com/content/image/1-s2.0-S0042698999001091-gr1.jpg")
    p4 = mint_embed_post(f1, "https://twitter.com/digitalps/status/756821215214460928")
    p5 = mint_embed_post(f1, "https://twitter.com/rankinphoto/status/1412678973021167617")
    p6 = mint_embed_post(f1, "https://twitter.com/FrancescSempere/status/1417230514801414146")
    p7 = mint_embed_post(f1, "https://twitter.com/CarpetBerber/status/1385054568518623237")
    p8 = mint_embed_post(f1, "https://twitter.com/GregCooperPhoto/status/1417132705565712389")
    p9 = mint_embed_post(f1, "https://twitter.com/NigelBarker/status/1417541834579058700")
    p10 = mint_embed_post(f1, "https://twitter.com/DrGotts/status/1418890369438294021")
    p11 = mint_embed_post(f1, "https://twitter.com/LantingFrans/status/1341911597921419264")
    p12 = mint_embed_post(f1, "https://twitter.com/bernabephoto/status/1419317140025397253")
    p13 = mint_embed_post(f1, "https://twitter.com/lindsayadler/status/1404833413920657415")
    p14 = mint_embed_post(f1, "https://www.youtube.com/watch?v=4yE0m-I4tY4")
    p15 = mint_embed_post(f1, "https://www.youtube.com/watch?v=WXdAX0No2hM")
    p16 = mint_embed_post(f1, "https://www.youtube.com/watch?v=hvqWeNBtlsc")
    p17 = mint_embed_post(f1, "https://www.youtube.com/watch?v=XPxpejPIV5w")
    p18 = mint_embed_post(f1, "https://www.instagram.com/p/COVi39ghNYu/")
    p19 = mint_embed_post(f1, "https://www.instagram.com/p/CF4-cJiBbNU/")
    p20 = mint_embed_post(f1, "https://www.instagram.com/p/CNu_Aysg9HR/")
    p21 = mint_embed_post(f1, "https://www.instagram.com/p/CLP9EMlA2nt/")
    p22 = mint_embed_post(f1, "https://www.instagram.com/p/BqdOGs1HP-N/")
    p23 = mint_embed_post(f1, "https://www.tiktok.com/@cendamakeup/video/6976104961683754245?lang=en&is_copy_url=1&is_from_webapp=v1")
    p24 = mint_embed_post(f1, "https://www.tiktok.com/@photography_bts/video/6826216639638342913?lang=en&is_copy_url=1&is_from_webapp=v1")
    p25 = mint_embed_post(f1, "https://www.tiktok.com/@cendamakeup/video/6976104961683754245?lang=en&is_copy_url=1&is_from_webapp=v1")
    p26 = mint_embed_post(f1, "https://www.tiktok.com/@authenticallan/video/6985640330045689094?lang=en&is_copy_url=1&is_from_webapp=v1")

puts "Seeded #{ f1.posts.count } posts in #{ f1.name } feed - #{ f1.user.name }"


f2 = Feed.create :name => 'Somewhat cringy motivation feed'
u2.feeds << f2
    mint_embed_post(f2, "https://www.youtube.com/watch?v=C-Cvl3_CH2A")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=g3s0--LcgQw")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=YMYgjVstBy0")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=zDIQQx1KNZc")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=Sy3Sghe5NPM")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=ZwYy4scOJi8")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=ZexvTZ1sV8U")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=67Vp7fTgQ3g")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=4d-P9baha-w")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=JIHTEYrFl_A")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=9OF06n1jNkM")
    mint_embed_post(f2, "https://dribbble.com/shots/6282968-Burnout")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=00cizszd4z0")
    mint_embed_post(f2, "https://dribbble.com/shots/8559770-work-harder")
    mint_embed_post(f2, "our work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.")
    mint_embed_post(f2, "https://www.youtube.com/watch?v=8-JXOnFOXQk")
    mint_embed_post(f2, "https://dribbble.com/shots/15171094-Positive-Notes")

puts "Seeded #{ f2.posts.count } posts in #{ f2.name } feed - #{ f2.user.name }"


f3 = Feed.create :name => 'Programming best practice osmosis'
u2.feeds << f3
    mint_embed_post(f3, "1. Don't reinvent the wheel <br /> 2. Stay dry <br />  3. Limit line length <br />  4. Consistency is key <br />  5. Avoid hard coding <br />  6. KISS <br />  7. Use descriptive names")
    mint_embed_post(f3, "https://soundcloud.com/user-697578497/ep-113-best-practice-of#t=1:25")
    mint_embed_post(f3, "https://soundcloud.com/blackspectacles-are-live/programming-planning-practice-mock-exam-answered")
    mint_embed_post(f3, "https://www.youtube.com/watch?v=iBNpb_pp1EE")
    mint_embed_post(f3, "https://www.youtube.com/watch?v=Mus_vwhTCq0")
    mint_embed_post(f3, "https://www.youtube.com/watch?v=g2nMKzhkvxw")
    mint_embed_post(f3, "https://www.youtube.com/watch?v=UjhX2sVf0eg")
    mint_embed_post(f3, "https://cdn.tutsplus.com/net/uploads/legacy/516_code/preview.jpg")

puts "Seeded #{ f3.posts.count } posts in #{ f3.name } feed - #{ f3.user.name }"

# f4 = Feed.create :name => 'Less toxic Twitter feed'
# u3.feeds << f4    
#     mint_embed_post(f3, "https://www.youtube.com/watch?v=iBNpb_pp1EE")

# puts "Seeded #{ f3.posts.count } posts in #{ f3.name } feed - #{ f3.user.name }"