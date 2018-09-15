class Dessert < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :name, :image #設為必填
  belongs_to :user
end
