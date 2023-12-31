# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cat1 = Cat.create!(name: "charles", color: "black", birth_date: "01/01/2001", sex: "M", description: "great!")

cat2 = Cat.create!(name: "tom", color: "brown", birth_date: "01/01/1991", sex: "M", description: "getting a lil old!")