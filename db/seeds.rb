# default admin

avatar1 = File.open("#{Rails.root}/app/assets/images/avatar1.jpg")
avatar17 = File.open("#{Rails.root}/app/assets/images/avatar17.jpg")
avatar9 = File.open("#{Rails.root}/app/assets/images/avatar9.jpg")

User.create(
  name: "admin",
  email: "admin@example.com",
  #avatar: avatar1,
  password: "12345678",
  role: "admin",
  intro: "吃甜甜網站管理員",
  contact_info:
  "您好： 感謝您購買我的商品 若集資成功 請依約定的時間地點準時面交 這是我的聯絡電話：0912123456"
)

# default users

User.create(
  name: "gudetama",
  email: "gudetama@example.com",
  #avatar: avatar17,
  password: "12345678",
  role: "general",
  intro: "蛋黃界的甜點大師",
  contact_info:
  "您好： 感謝您購買我的商品 若集資成功 請依約定的時間地點準時面交 這是我的聯絡電話：0905345678"
)

User.create(
  name: "bear",
  email: "bear@example.com",
  #avatar: avatar9,
  password: "12345678",
  role: "general",
  intro: "熱愛做甜點的大熊",
  contact_info:
  "您好： 感謝您購買我的商品 若集資成功 請依約定的時間地點準時面交 這是我的聯絡電話：0988567567"
)

# default categories

Category.destroy_all

category_list = [
  { area: "蛋糕"},
  { area: "塔派"},
  { area: "馬卡龍"}
]

category_list.each do |category|
  Category.create( area: category[:area])
end

# default desserts

Dessert.destroy_all

time_month = FFaker::Time.between(Time.now, Time.now + 1.months)
file1 = File.open("#{Rails.root}/app/assets/images/seed_cake1.jpg")
file2 = File.open("#{Rails.root}/app/assets/images/seed_cake2.jpg")
file3 = File.open("#{Rails.root}/app/assets/images/seed_ma.jpg")
file4 = File.open("#{Rails.root}/app/assets/images/seed_ta1.jpg")
file5 = File.open("#{Rails.root}/app/assets/images/seed_ta2.jpg")

Dessert.create!(
  name: "豆豆龍芝麻千層蛋糕",
  amount: 10,
  origin_amount: 10,
  location: "大安捷運站",
  price: 150,
  category_id: Category.first.id,
  description: FFaker::Lorem.paragraph,
  user_id: User.first.id,
  ig_image_url: "https://www.instagram.com/p/BnYMRswHt16/?utm_source=ig_web_button_share_sheet",
  #intro_image: file1,
  excess_time: time_month,
  pick_time: time_month + 1.day
)


Dessert.create!(
  name: "睡美人千層",
  amount: 10,
  origin_amount: 10,
  location: "大安捷運站",
  price: 150,
  category_id: Category.first.id,
  description: FFaker::Lorem.paragraph,
  user_id: User.first.id,
  ig_image_url: "https://www.instagram.com/p/Beg_ns0Fxdh/?utm_source=ig_web_button_share_sheet",
  #intro_image: file2,
  excess_time: time_month,
  pick_time: time_month + 1.day
)

Dessert.create!(
  name: "奶油檸檬塔",
  amount: 10,
  origin_amount: 10,
  location: "台中文心公園",
  price: 150,
  category_id: Category.second.id,
  description: FFaker::Lorem.paragraph,
  user_id: User.second.id,
  ig_image_url: "https://www.instagram.com/p/BojVCdUA6Hy/?utm_source=ig_web_button_share_sheet",
  #intro_image: file5,
  excess_time: time_month,
  pick_time: time_month + 1.day
)

Dessert.create!(
  name: "芒果起司塔",
  amount: 10,
  origin_amount: 10,
  location: "台中文心公園",
  price: 150,
  category_id: Category.second.id,
  description: FFaker::Lorem.paragraph,
  user_id: User.second.id,
  ig_image_url: "https://www.instagram.com/p/BKu7sF_BnOw/?utm_source=ig_web_button_share_sheet",
  #intro_image: file4,
  excess_time: time_month,
  pick_time: time_month + 1.day
)

Dessert.create!(
  name: "黃色小鴨馬卡龍",
  amount: 10,
  origin_amount: 10,
  location: "高雄火車站",
  price: 150,
  category_id: Category.third.id,
  description: FFaker::Lorem.paragraph,
  user_id: User.third.id,
  ig_image_url: "https://www.instagram.com/p/BoT_h0hHQcp/?utm_source=ig_web_button_share_sheet",
  #intro_image: file3,
  excess_time: time_month,
  pick_time: time_month + 1.day
)

Dessert.create!(
  name: "HUG ME 馬卡龍",
  amount: 10,
  origin_amount: 10,
  location: "高雄火車站",
  price: 150,
  category_id: Category.third.id,
  description: FFaker::Lorem.paragraph,
  user_id: User.third.id,
  ig_image_url: "https://www.instagram.com/p/BmlUhKCHmVP/?utm_source=ig_web_button_share_sheet",
  #intro_image: file3,
  excess_time: time_month,
  pick_time: time_month + 1.day
)

puts "Default admin created!"
puts "Default categories created!"
puts "Default desserts created!"
