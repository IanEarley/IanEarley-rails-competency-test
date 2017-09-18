# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |category|
  Category.create!(title: "Category #{category}")
end

puts "4 categories were created..."

User.create!(email: "user@test.com",
             password: "asdfasdf",
             password_confirmation: "asdfasdf",
             roles: "user"
            )
puts "1 regular user created..."

User.create!(email: "editor@test.com",
             password: "asdfasdf",
             password_confirmation: "asdfasdf",
             roles: "editor"
            )
puts "1 editor user created..."

2.times do |admin|
  User.create!(email: "admin#{admin}@test.com",
               password: "asdfasdf",
               password_confirmation: "asdfasdf",
               roles: "admin"
              )
end
puts "2 admin user created..."

4.times do |article|
  NewsArticle.create!(title: "Article #{article}",
                      body: "Use the force Luke.",
                      categories_id: 1,
                      users_id: 2
                      )
end

puts "4 articles created for category 1..."

4.times do |article|
  NewsArticle.create!(title: "Article #{article}",
                      body: "That's no moon...",
                      categories_id: 2,
                      users_id: 2
                      )
end

puts "4 articles created for category 2..."

4.times do |article|
  NewsArticle.create!(title: "Article #{article}",
                      body: "I know.",
                      categories_id: 3,
                      users_id: 3
                      )
end

puts "4 artilces created for category 3..."

4.times do |article|
  NewsArticle.create!(title: "Article #{article}",
                      body: "Like shootin womprats eh kid?",
                      categories_id: 4,
                      users_id: 3
                      )
end

puts "4 articles created for category 4..."