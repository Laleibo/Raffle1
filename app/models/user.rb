class User < ApplicationRecord
  has_secure_password
  has_many :tickets
  has_many :raffles, through: :tickets
end
