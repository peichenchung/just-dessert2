class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dessert
  has_many :replies, dependent: :destroy
end
