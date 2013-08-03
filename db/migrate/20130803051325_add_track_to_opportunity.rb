class AddTrackToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :track, :string
    add_index :opportunities, :track
  end
end
