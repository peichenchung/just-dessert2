class Dessert < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :name, :price, :amount, :location, :image #設為必填
  belongs_to :user #seller
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  belongs_to :category

  def time_up? #募資時間到
    self.excess_time < Time.now
  end

  def sold_out? #已售完
    self.amount == 0
  end
end
