class User < ActiveRecord::Base
  validates :name, length: {maximum: 30}, presence: true, uniqueness: {:scope => :name}
  validates :password, length: {maximum: 50, minimum: 6}, presence: true 
  has_secure_password
  validates :key, presence: true
end
