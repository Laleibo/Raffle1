class Raffle < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

# def winner(raffle_id)
#
# end
end
