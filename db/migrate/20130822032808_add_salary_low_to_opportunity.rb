class AddSalaryLowToOpportunity < ActiveRecord::Migration
  def up
    remove_column :opportunities, :salary
    add_column :opportunities, :salary_low, :integer
    add_column :opportunities, :salary_high, :integer
  end

  def down
    remove_column :opportunities, :salary_low
    remove_column :opportunities, :salary_high
    add_column :opportunities, :salary, :integer
  end
end
