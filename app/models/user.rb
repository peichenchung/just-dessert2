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

  def self.find_for_oauth(auth)
    User.find_or_create_by(uid: auth.uid, provider: auth.provider) do |user|
      user.email    = User.tmp_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def self.tmp_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
