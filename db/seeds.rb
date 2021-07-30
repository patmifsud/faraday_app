
puts "Seeding Db..."

# SEED BUILDERS
@post_demo_content = ["What a great day for a walk", "Life is like a box" ]


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
f1 = Feed.create :name => 'Photography study for 🚂'
u1.feeds << f1
    p1 = Post_factory.mint_image_post("https://photoshootgoals.com/wp-content/uploads/2020/10/manual-photography-cheat-sheet-photo-shoot-goals.jpg", f1)
    p3 = Post_factory.mint_image_post("https://ars.els-cdn.com/content/image/1-s2.0-S0042698999001091-gr1.jpg", f1)
    p4 = Post_factory.mint_embed_post("https://twitter.com/digitalps/status/756821215214460928", f1)
    p5 = Post_factory.mint_embed_post("https://twitter.com/rankinphoto/status/1412678973021167617", f1)
    p6 = Post_factory.mint_embed_post("https://twitter.com/FrancescSempere/status/1417230514801414146", f1)
    p7 = Post_factory.mint_embed_post("https://twitter.com/CarpetBerber/status/1385054568518623237", f1)
    p8 = Post_factory.mint_embed_post("https://twitter.com/GregCooperPhoto/status/1417132705565712389", f1)
    p9 = Post_factory.mint_embed_post("https://twitter.com/NigelBarker/status/1417541834579058700", f1)
    p10 = Post_factory.mint_embed_post("https://twitter.com/DrGotts/status/1418890369438294021", f1)
    p11 = Post_factory.mint_embed_post("https://twitter.com/LantingFrans/status/1341911597921419264", f1)
    p12 = Post_factory.mint_embed_post("https://twitter.com/bernabephoto/status/1419317140025397253", f1)
    p13 = Post_factory.mint_embed_post("https://twitter.com/lindsayadler/status/1404833413920657415", f1)
    p14 = Post_factory.mint_embed_post("https://www.youtube.com/watch?v=4yE0m-I4tY4", f1)
    p15 = Post_factory.mint_embed_post("https://www.youtube.com/watch?v=WXdAX0No2hM", f1)
    p16 = Post_factory.mint_embed_post("https://www.youtube.com/watch?v=hvqWeNBtlsc", f1)
    p17 = Post_factory.mint_embed_post("https://www.youtube.com/watch?v=XPxpejPIV5w", f1)
    p18 = Post_factory.mint_embed_post("https://www.instagram.com/p/COVi39ghNYu/", f1)
    p19 = Post_factory.mint_embed_post("https://www.instagram.com/p/CF4-cJiBbNU/", f1)
    p20 = Post_factory.mint_embed_post("https://www.instagram.com/p/CNu_Aysg9HR/", f1)
    p21 = Post_factory.mint_embed_post("https://www.instagram.com/p/CLP9EMlA2nt/", f1)
    p22 = Post_factory.mint_embed_post("https://www.instagram.com/p/BqdOGs1HP-N/", f1)

puts "Seeded #{ f1.posts.count } posts in #{ f1.name } feed - #{ f1.user.name }"


f2 = Feed.create :name => 'Somewhat cringey motivational feed'
u2.feeds << f2
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=C-Cvl3_CH2A", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=g3s0--LcgQw", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=YMYgjVstBy0", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=zDIQQx1KNZc", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=Sy3Sghe5NPM", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=ZwYy4scOJi8", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=ZexvTZ1sV8U", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=67Vp7fTgQ3g", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=4d-P9baha-w", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=JIHTEYrFl_A", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=9OF06n1jNkM", f2)
    Post_factory.mint_embed_post("https://dribbble.com/shots/6282968-Burnout", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=00cizszd4z0", f2)
    Post_factory.mint_embed_post("https://dribbble.com/shots/8559770-work-harder", f2)
    Post_factory.mint_text_post("our work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.", f2)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=8-JXOnFOXQk", f2)
    Post_factory.mint_embed_post("https://dribbble.com/shots/15171094-Positive-Notes", f2)

puts "Seeded #{ f2.posts.count } posts in #{ f2.name } feed - #{ f2.user.name }"


f3 = Feed.create :name => 'Programming best practice osmosis'
u2.feeds << f3
    Post_factory.mint_text_post("1. Don't reinvent the wheel <br /> 2. Stay dry <br />  3. Limit line length <br />  4. Consistency is key <br />  5. Avoid hard coding <br />  6. KISS <br />  7. Use descriptive names", f3)
    Post_factory.mint_embed_post("https://soundcloud.com/user-697578497/ep-113-best-practice-of#t=1:25", f3)
    Post_factory.mint_embed_post("https://soundcloud.com/blackspectacles-are-live/programming-planning-practice-mock-exam-answered", f3)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=iBNpb_pp1EE", f3)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=Mus_vwhTCq0", f3)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=g2nMKzhkvxw", f3)
    Post_factory.mint_embed_post("https://www.youtube.com/watch?v=UjhX2sVf0eg", f3)
    Post_factory.mint_embed_post("https://cdn.tutsplus.com/net/uploads/legacy/516_code/preview.jpg", f3)

puts "Seeded #{ f3.posts.count } posts in #{ f3.name } feed - #{ f3.user.name }"



# f4 = Feed.create :name => 'Less toxic Twitter feed'
# u3.feeds << f4    
#     mint_embed_post("https://www.youtube.com/watch?v=iBNpb_pp1EE")

# puts "Seeded #{ f3.posts.count } posts in #{ f3.name } feed - #{ f3.user.name }"