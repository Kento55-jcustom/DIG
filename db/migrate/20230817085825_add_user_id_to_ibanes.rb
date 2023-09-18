class AddUserIdToIbanes < ActiveRecord::Migration[7.0]
  def change
    add_column :ibanes, :user_id, :integer
  end
end
