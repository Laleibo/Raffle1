class CreateRaffles < ActiveRecord::Migration[5.0]
  def change
    create_table :raffles do |t|
      t.string :title
      t.text :description
      t.text :prize
      t.integer :max_tickets

      t.timestamps
    end
  end
end
