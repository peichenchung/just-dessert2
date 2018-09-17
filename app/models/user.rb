class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  has_many :desserts, dependent: :destroy #user建立的甜點
  has_many :orders, dependent: :destroy #user購買的訂單
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end

end
