# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by(email: "admin@admin.com")

if user.nil?
  user = User.create!(
    email: "admin@admin.com",
    password: "administrator",
    password_confirmation: "administrator",
  )
  user.skip_confirmation!
  user.save!
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')