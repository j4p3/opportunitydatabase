class AddNotesToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :notes, :string
  end
end
