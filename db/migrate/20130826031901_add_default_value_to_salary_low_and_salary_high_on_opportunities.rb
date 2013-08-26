class AddDefaultValueToSalaryLowAndSalaryHighOnOpportunities < ActiveRecord::Migration
  def up
    change_column :opportunities, :salary_low, :integer, default: 0
    change_column :opportunities, :salary_high, :integer, default: 0
  end
  def down
  end
end
