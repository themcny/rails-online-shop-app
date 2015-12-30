class User < ActiveRecord::Base
validates :email,  presence: true, uniqueness: true
validates :password, presence: true, length: { in: 6..20}
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
