class Category < ApplicationRecord
  has_many :desserts, dependent: :destroy
end
