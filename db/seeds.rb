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
    email: "user#{n + 1}@test.com",
    sex: "未回答",
    password: '000000',
    password_confirmation: '000000',
    prefecture_code: Gimei.prefecture.kanji,
    city: Gimei.city.kanji
  )
end

Genre.create!(
  [{name: "肉・肉加工品"}, {name: "水産物・水産加工品"}, {name: "野菜"}, {name: "果物"}, {name: "卵・チーズ・乳製品"}, {name: "米・雑穀"}, {name: "麺類"}, {name: "パン・製菓"}, {name: "粉類"}, {name: "乾物"}, {name: "調味料"}, {name: "飲料"}, {name: "酒類"}]
  )

10.times do
  Post.create!(
    image: File.open('./app/assets/images/niku.jpg'),
    name: "テスト肉",
    user_id: 1,
    genre_id: 1,
    price: 1000,
    storage: "冷蔵",
    expired: "2021-06-30",
    body: "肉汁ブシャー",
    prefecture_code: Gimei.prefecture
  )

  Post.create!(
    image: File.open('./app/assets/images/shell.jpg'),
    name: "テストホタテ",
    user_id: 2,
    genre_id: 2,
    storage: "冷蔵",
    expired: "2021-06-30",
    price: 500,
    body: "パクパクホタテ",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/yasai.jpg'),
    name: "テスト野菜",
    user_id: 3,
    genre_id: 3,
    storage: "冷蔵",
    expired: "2021-06-30",
    price: 300,
    body: "シャキシャキ野菜",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/apple.jpg'),
    name: "テスト果物",
    user_id: 4,
    genre_id: 4,
    storage: "冷蔵",
    expired: "2021-06-30",
    price: 600,
    body: "しゃりしゃり果物",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/egg.jpg'),
    name: "テスト卵",
    user_id: 5,
    genre_id: 5,
    storage: "冷蔵",
    expired: "2021-06-30",
    price: 100,
    body: "たまたまたまご",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/rice.jpg'),
    name: "テスト米",
    user_id: 6,
    genre_id: 6,
    storage: "常温",
    expired: "2021-06-30",
    price: 2000,
    body: "米米CLUB",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/men.jpg'),
    name: "テスト麺類",
    user_id: 7,
    genre_id: 7,
    storage: "冷蔵",
    expired: "2021-06-30",
    price: 150,
    body: "チャーシューメーン",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/pan.jpg'),
    name: "テストぱん・製菓",
    user_id: 8,
    genre_id: 8,
    storage: "常温",
    expired: "2021-06-30",
    price: 300,
    body: "焼きたてジャぱん",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/hakuriki.jpg'),
    name: "テスト粉類",
    user_id: 9,
    genre_id: 9,
    storage: "常温",
    expired: "2021-06-30",
    price: 200,
    body: "白い粉",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/pol.jpg'),
    name: "テスト乾物",
    user_id: 10,
    genre_id: 10,
    storage: "常温",
    expired: "2021-06-30",
    price: 3000,
    body: "ポルチーニ",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/spyce.jpg'),
    name: "テスト調味料",
    user_id: 11,
    genre_id: 11,
    storage: "常温",
    expired: "2021-06-30",
    price: 400,
    body: "ガラムマサラ",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/coke.jpg'),
    name: "テスト飲料",
    user_id: 12,
    genre_id: 12,
    storage: "冷蔵",
    expired: "2021-06-30",
    price: 2500,
    body: "トゲコーラ",
    prefecture_code: Gimei.prefecture
    )

  Post.create!(
    image: File.open('./app/assets/images/sake.jpg'),
    name: "テスト酒類",
    user_id: 13,
    genre_id: 13,
    storage: "常温",
    expired: "2021-06-30",
    price: 29800,
    body: "響の30年",
    prefecture_code: Gimei.prefecture
    )
    
end
