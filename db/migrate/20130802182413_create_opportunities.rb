class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :position
      t.string :company
      t.string :location
      t.integer :salary
      t.string :contact
      t.string :link
      t.timestamps
    end
  end
end