class User < ApplicationRecord
  has_secure_password
  has_many :tickets, dependent: :destroy
  has_many :raffles, through: :tickets
  has_many :winner_raffles, class_name: "Raffle"
end
