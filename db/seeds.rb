# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

EndUser.create!(
    email: "a@a",
    last_name: "姓",
    first_name: "名",
    last_name_kana: "セイ",
    first_name_kana: "メイ",
    postcode: "579",
    user_address: "東京都",
    phone_number: "090",
    password: "aaaaaa"
)


Genre.create!(
  [
    {
      name: "ケーキ",
      is_active: "true"
    },
    {
      name: "プリン",
      is_active: "true"
    },
    {
      name: "焼き菓子",
      is_active: "true"
    },
    {
      name: "キャンディ",
      is_active: "true"
    }
  ]
)

Item.create!(
   genre_id: '1',
   name: 'いちごのショートケーキ',
   description: 'いちごのショートケーキの説明',
   price: '1000',
   image: File.open('./app/assets/images/test.jpg'),
   sales_status: '販売中'
)

Item.create!(
   genre_id: '1',
   name: 'チーズタルト',
   description: 'チーズタルトの説明',
   price: '150',
   image: File.open('./app/assets/images/test.jpg'),
   sales_status: '販売中'
)

Address.create!(
   end_user_id: '1',
   name: 'おじいちゃん',
   postcode: '7878',
   address: '岩手県',
)

Address.create!(
   end_user_id: '1',
   name: 'おばあちゃん',
   postcode: '7878',
   address: '福岡県',
)