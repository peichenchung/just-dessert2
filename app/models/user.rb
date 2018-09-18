class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:instagram]

  validates_presence_of :name
  has_many :desserts, dependent: :destroy #user建立的甜點
  has_many :orders, dependent: :destroy #user購買的訂單
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_ig_uid( auth.uid )
    if user
      user.ig_token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.ig_uid = auth.uid
      existing_user.ig_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.ig_uid = auth.uid
    user.ig_token = auth.credentials.token
    user.email = User.tmp_email(auth)
    user.name = auth.info.name
    user.password = Devise.friendly_token[0,20]
    user.save!
    return user
  end

  private

  def self.tmp_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
