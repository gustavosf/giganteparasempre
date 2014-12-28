# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.delete_all
users = JSON.parse(File.read(Rails.root.join('db/seeds/users.json')))
users.each do |user|
  User.create!(user)
end

# Limpa a coleção de elementos (albuns, videos, fotos, etc)
Element.delete_all

# Carrega álbuns
albuns = JSON.parse(File.read(Rails.root.join('db/seeds/albuns.json')))
albuns.each do |album|
  Album.create!(album)
end

# Carrega fotos
# photos = JSON.parse(File.read(Rails.root.join('db/seeds/items.json')))
# photos.each do |photo|
#   Photo.create!(photo)
# end

# Carrega postagens no blog ou páginas estáticas
posts = JSON.parse(File.read(Rails.root.join('db/seeds/posts.json')))
posts.each do |post|
  Post.create!(post)
end

# Carrega videos do youtube
require 'open-uri'
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

# Element.delete_all

# # Carrega os albuns
# albuns = JSON.parse(File.read(Rails.root.join('db/seeds/albuns.json')))
# albuns.each do |album|
#   album['type'] = 'album'
#   Element.create!(album)
# end

# # Carrega as fotos
# items = JSON.parse(File.read(Rails.root.join('db/seeds/items.json')))
# items.each do |item|
#   item['type'] = 'photo'
#   Element.create!(item)
# end

# # Carrega postagens, entrevistas e afins
# posts = JSON.parse(File.read(Rails.root.join('db/seeds/posts.json')))
# posts.each do |post|
#   post['type'] = 'blog-entry'
#   Element.create_post!(post)
# end

# # Carrega os videos iterativamente (50 por vez que é o limite da api)
# require 'open-uri'
# i = 1
# while 1
#   url = "https://gdata.youtube.com/feeds/api/videos?author=beirariogps&v=2&orderby=updated&alt=jsonc&max-results=50&start-index=#{i}"
#   videos = JSON.parse open(url).read
#   break if videos['data']['items'].nil?
#   for video in videos['data']['items'].each
#     video['type'] = 'video'
#     Element.create!(video)
#   end
#   i = i + 50
# end