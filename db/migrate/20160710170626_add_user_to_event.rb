class AddUserToRaffle < ActiveRecord::Migration[5.0]
  def change
    add_reference :raffles, :user, foreign_key: true
  end
end
