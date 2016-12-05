class AddIndexOnLikes < ActiveRecord::Migration
  def change
  	add_index :likes, [:user_id, :status_id], :unique => true
  end
end
