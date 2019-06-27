class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, length:{minimum: 4, maximum: 25}, presence: true

  has_many :messages

end
