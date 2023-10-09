class RemoveCpuFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :cpu, :string
  end
end
