
puts "Seeding Db..."

# SEED BUILDERS
@post_demo_content = ["What a great day for a walk", "Life is like a box" ]
@post_incr = 1

def mill_post(parent_feed, 
    title = "post #{@post_incr}", 
    content = @post_demo_content.sample, 
    i = @post_incr)
        i += 1
        post = Post.create :title => title, :content => content
        parent_feed.posts << post
        return post
end


# CLEAR
User.destroy_all
Feed.destroy_all
Post.destroy_all


# MAKE USERS
u1 = User.create :email => 'a@a.a', :name => 'Chris', :password => 'chicken'
u2 = User.create :email => 'aa@a.a', :name => 'Mary', :password => 'chicken'
u3 = User.create :email => 'aaa@a.a', :name => 'Fay', :password => 'chicken'
puts "Seeded #{ User.count } users"


# MAKE FEEDS AND POSTS
f1 = Feed.create :name => 'Inspiration'
u1.feeds << f1
    p1 = mill_post(f1)
    p2 = mill_post(f1)
    p3 = mill_post(f1)
    p4 = mill_post(f1)
puts "Seeded #{ f1.posts.count } posts in #{ f1.name } feed - #{ f1.user.name }"

f2 = Feed.create :name => 'Learn ruby'
u1.feeds << f2
    p5 = mill_post(f2)
    p6 = mill_post(f2)
    p7 = mill_post(f2)
puts "Seeded #{ f2.posts.count } posts in #{ f2.name } feed - #{ f2.user.name }"

f3 = Feed.create :name => 'Morning exercise'
u2.feeds << f3
    p8 = mill_post(f3)
    p9 = mill_post(f3)
    p10 = mill_post(f3)
puts "Seeded #{ f3.posts.count } posts in #{ f3.name } feed - #{ f3.user.name }"