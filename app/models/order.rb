class Order < ApplicationRecord
  validates_presence_of :name, :phone, :amount #設為必填
  belongs_to :user
  belongs_to :dessert
  belongs_to :seller, class_name: "User"
end
