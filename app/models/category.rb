class Category < ApplicationRecord
  validates_presence_of :area

  has_many :desserts, dependent: :destroy
end
