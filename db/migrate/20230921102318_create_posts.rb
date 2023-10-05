class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :cpu, null: false
      t.string :motherboard, null: false
      t.string :memory, null: false
      t.string :power_supply_unit, null: false
      t.string :computer_case, null: false
      t.string :hdd
      t.string :ssd
      t.string :cpu_cooler, null: false
      t.string :graphics_board, null: false
      t.integer :total_price, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
