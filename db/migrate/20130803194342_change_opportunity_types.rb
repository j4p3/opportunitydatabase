class ChangeOpportunityTypes < ActiveRecord::Migration
  def change
    change_column(:opportunities, :link, :text)
    change_column(:opportunities, :notes, :text)
  end
end
