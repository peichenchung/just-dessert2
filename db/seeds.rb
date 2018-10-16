# default admin

file = File.open("#{Rails.root}/app/assets/images/avatar17.jpg")

User.create(
  name: "admin",
  email: "admin@example.com",
  avatar: file,
  password: "12345678",
  role: "admin",
  intro: "吃甜甜網站管理員",
  contact_info:
  "您好： 感謝您購買我的商品 若集資成功 請依約定的時間地點準時面交 這是我的聯絡電話：0912123456"
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

puts "Default categories created!"
puts "Default admin created!"
