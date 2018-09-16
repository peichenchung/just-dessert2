class Order < ApplicationRecord
  validates_presence_of :name, :phone, :amount #設為必填
  validates :amount, numericality: { only_integer: true } #只能填數字，且必須是整數
  belongs_to :user
  belongs_to :dessert
  belongs_to :seller, class_name: "User"
end
