class AddUserIdToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :user_id, :integer
  end
end
