# default admin

file = File.open("#{Rails.root}/app/assets/images/avatar17.jpg")

User.create(
  name: "admin",
  email: "admin@example.com",
  avatar: file,
  password: "12345678",
  role: "admin"
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
