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
  
