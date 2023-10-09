class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cpu_kind, :integer, null: false, default: 0
    add_column :posts, :cpu_model_number, :string
  end
end
