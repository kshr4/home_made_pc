class CreateGreats < ActiveRecord::Migration[6.1]
  def change
    create_table :greats do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
