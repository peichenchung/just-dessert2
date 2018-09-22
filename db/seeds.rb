# Default admin

User.create(
  name: "admin",
  email: "admin@example.com",
  password: "12345678",
  role: "admin"
)

Category.destroy_all

category_list = [
  { area: "北部"},
  { area: "中部"},
  { area: "南部"}
]

category_list.each do |category|
  Category.create( area: category[:area])
end
puts "Category created!"
puts "Default admin created!"
