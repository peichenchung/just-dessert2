class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dessert
  belongs_to :seller, class_name: "User"
end
