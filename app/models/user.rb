class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  has_many :desserts, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
  
end
