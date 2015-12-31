class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :email,  presence: true, uniqueness: true, length: {maximum: 255}
  validates :password, presence: true, length: { in: 6..20}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_secure_password
end
