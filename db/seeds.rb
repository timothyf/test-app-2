# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create admin user
AdminUser.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

puts "Admin user created: admin@example.com / password"

# Create sample posts
[
  {
    title: "Welcome to the Blog",
    body: "This is the first post on our new Rails application. " \
          "We're excited to share our journey with you.",
    published: true,
    published_at: 1.week.ago
  },
  {
    title: "Getting Started with Ruby on Rails",
    body: "Ruby on Rails is a powerful web application framework that follows " \
          "convention over configuration to help you build web apps quickly.",
    published: true,
    published_at: 3.days.ago
  },
  {
    title: "Introduction to Vue.js",
    body: "Vue.js is a progressive JavaScript framework for building user interfaces. " \
          "It integrates smoothly with Rails via importmaps.",
    published: false,
    published_at: nil
  }
].each do |attrs|
  Post.find_or_create_by!(title: attrs[:title]) do |post|
    post.assign_attributes(attrs)
  end
end

puts "Sample posts created."
