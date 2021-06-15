# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = :ja

Admin.create!(
  email: 'admin@test.com',
  password: '000000',
)


20.times do |n|
  User.create!(
    name: Faker::JapaneseMedia::StudioGhibli.unique.character,
    email: "user#{n}@test.com",
    password: '000000',
    password_confirmation: '000000',
    postal_code: Faker::Address.postcode,
    prefecture_code: Gimei.prefecture.kanji,
    city: Gimei.city.kanji
  )
end

Genre.create!(
  [{name: "肉・肉加工品"}, {name: "水産物・水産加工品"}, {name: "野菜"}, {name: "果物"}, {name: "卵・チーズ・乳製品"}, {name: "米・雑穀"}, {name: "麺類"}, {name: "パン"}, {name: "粉類"}, {name: "乾物"}, {name: "調味料"}, {name: "飲料"}, {name: "酒類"}]
  )
