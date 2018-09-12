# Default admin

User.create(
  name: "admin", 
  email: "admin@example.com", 
  password: "12345678", 
  role: "admin"
)

puts "Default admin created!"