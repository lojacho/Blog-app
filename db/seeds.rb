# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = [
    { name: 'Tanjiro Kamado', photo: 'https://static.zerochan.net/Kamado.Tanjirou.full.2705519.jpg', bio: 'Friendly guy that leaves as a demon slayer.' },
    { name: 'Nezuko Kamado', photo: 'https://static.zerochan.net/Kamado.Nezuko.full.2843321.jpg', bio: 'Tanjiro\'s younger sister who turns into a demon.' },
    { name: 'Zenitsu Agatsuma', photo: 'https://static.zerochan.net/Agatsuma.Zenitsu.full.2740892.jpg', bio: 'A cowardly demon slayer who becomes stronger during battles.' },
    { name: 'Inosuke Hashibira', photo: 'https://static.zerochan.net/Hashibira.Inosuke.full.2668366.jpg', bio: 'A wild and aggressive demon slayer who wears a boar mask.' },
    { name: 'Kyojuro Rengoku', photo: 'https://static.zerochan.net/Rengoku.Kyoujurou.full.2729123.jpg', bio: 'The Flame Hashira and a skilled swordsman.' },
    { name: 'Giyu Tomioka', photo: 'https://static.zerochan.net/Tomioka.Giyuu.full.2633967.jpg', bio: 'The Water Hashira and a reserved demon slayer.' }
  ]
  
users.each do |user|
    User.create(user)
end

user = User.find_by(name: 'Tanjiro Kamado')

posts = [
    { author: user, title: 'My first post', text: 'This battle was agains my own sister that was converted to demon' },
    { author: user, title: 'My second post', text: 'A old and frindly guy teach me to fight and breath' },
    { author: user, title: 'My third post', text: 'A old and frindly guy teach me to fight and breath' },
    { author: user, title: 'My third to last post', text: '3re A old and frindly guy teach me to fight and breath' },
    { author: user, title: 'My second to last post', text: 'This is my second new post' },
    { author: user, title: 'My Last one post', text: 'My last fight again a demon was with my friends' }

]

posts.each do |post|
    Post.create(post)
end

post = Post.find_by(title: 'My Last one post')

comments = [
    { post: post, user_id: user.id, text: 'This is the first comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the second comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the third comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the fourth comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the fifth comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the sixth comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the seventh comment for My Last one post', author_id: user.id, author_type: user},
    { post: post, user_id: user.id, text: 'This is the eighth comment for My Last one post', author_id: user.id, author_type: user},

]

comments.each do |comment|
    Comment.create(comment)
end