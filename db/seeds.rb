# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require'faker'

require 'faker'

10.times do
  city = City.create!(name: Faker::Address.city, postal_code: Faker::Address.postcode)
end

15.times do
  city = City.offset(rand(City.count)).first
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name  , email: Faker::Internet.email, age: rand(88), description: Faker::FamousLastWords.last_words, city_id: city.id, password: "1234")
end

25.times do
  use = User.offset(rand(User.count)).first
  gossip = Gossip.create!(title: Faker::Lovecraft.tome, content: Faker::Lovecraft.paragraph, user: use, date: Time.now)
end

10.times do
  tag = Tag.create!(tag: Faker::StarWars.planet)
  tag.gossip_ids = rand(Gossip.first.id..Gossip.last.id)
end

Gossip.all.each do |gossip|
  gossip.tag_ids = rand(Tag.first.id..Tag.last.id)
end

3.times do
  sender = User.offset(rand(User.count)).first
  pm = Pm.create!(content: Faker::Lorem.paragraph, sender: sender, date: Time.now) 
  if rand(1..2) == 1
    rec = User.offset(rand(User.count)).first
    rec.pm_ids = pm.id
  else
    rand(1..10).times do
      rec = User.offset(rand(User.count)).first
      rec.pm_ids = pm.id
    end
  end
end

i=0
50.times do
  if i==0
    use = User.offset(rand(User.count)).first
    gos = Gossip.offset(rand(Gossip.count)).first
    comment = gos.comments.create!(content: Faker::HitchhikersGuideToTheGalaxy.quote, user: use)
    i+=1
  else
    i=rand(1..2)
    if i ==1
      use = User.offset(rand(User.count)).first
      gos = Gossip.offset(rand(Gossip.count)).first
      comment = gos.comments.create!(content: Faker::HitchhikersGuideToTheGalaxy.quote, user: use)
    else
      use = User.offset(rand(User.count)).first
      com = Comment.offset(rand(Comment.count)).first
      comment = com.comments.create!(content: Faker::HitchhikersGuideToTheGalaxy.quote, user: use)
    end
  end
end

20.times do
  i=rand(1..2)
  if i ==1
    use = User.offset(rand(User.count)).first
    gos = Gossip.offset(rand(Gossip.count)).first
    comment = gos.likes.create!(user: use)
  else
    use = User.offset(rand(User.count)).first
    com = Comment.offset(rand(Comment.count)).first
    comment = com.likes.create!(user: use)
  end
end