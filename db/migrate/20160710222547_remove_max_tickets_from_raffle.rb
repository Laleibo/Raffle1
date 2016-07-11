class RemoveMaxTicketsFromRaffle < ActiveRecord::Migration[5.0]
  def change
    remove_column :raffles, :max_tickets
  end
end
