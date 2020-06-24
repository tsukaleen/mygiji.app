class AddUserIdToGijis < ActiveRecord::Migration[5.2]
  def change
    add_column :gijis, :user_id, :integer
  end
end
