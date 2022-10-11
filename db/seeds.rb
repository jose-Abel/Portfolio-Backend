# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


lifestyle_articles = Project.new({
  title: "Lifestyle Articles App",
  description: "Based on the website design of Nelson Sakwa on Behance. Build with Ruby on Rails, the project has the models, views and controllers of each of the resources User, Article, Vote and Category. The User has authentication and can perform any of the CRUD operations on the Articles and can create and delete a Vote. Article and Category has a many to many relationship. The Article with the most Vote will be displayed in the hero section of the main page.",
  see_code: "https://github.com/jose-Abel/lifestyle-articles-rails-capstone",
  live_version: "https://lifestyle-articles-jose-abel.herokuapp.com"
})

lifestyle_articles.images.attach(io: File.open('storage/images/life-style-articles-app.png'), filename: 'lifestylearticles.png', content_type: 'png')

lifestyle_articles.save!