# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |n|
  User.create!(
    name: Faker::JapaneseMedia::StudioGhibli.unique.character,
    email: "user#{n}@test.com",
    password: '000000',
    password_confirmation: '000000',
    postal_code: '5460043',
    prefecture_code: '大阪府',
    city: '大阪市東住吉区駒川'
  )
end