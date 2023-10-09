class AddCpuToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cpu, :string, default: ""
    change_column :posts, :cpu, :string, :null => false
  end
end
