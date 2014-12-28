# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Album.delete_all
# albuns = JSON.parse(File.read(Rails.root.join('db/seeds/albuns.json')))
# albuns.each do |album|
#   Album.create!(album)
# end

# Item.delete_all
# items = JSON.parse(File.read(Rails.root.join('db/seeds/items.json')))
# items.each do |item|
#   Item.create!(item)
# end

# User.delete_all
# users = JSON.parse(File.read(Rails.root.join('db/seeds/users.json')))
# users.each do |user|
#   User.create!(user)
# end

# Post.delete_all
# posts = JSON.parse(File.read(Rails.root.join('db/seeds/posts.json')))
# posts.each do |post|
#   Post.create!(post)
# end

require 'open-uri'
Video.delete_all
i = 1

while 1
  url = "https://gdata.youtube.com/feeds/api/videos?author=beirariogps&v=2&orderby=updated&alt=jsonc&max-results=50&start-index=#{i}"
  videos = JSON.parse open(url).read
  break if videos['data']['items'].nil?

  for video in videos['data']['items'].each
    Video.create!(video)
  end

  i = i + 50
end