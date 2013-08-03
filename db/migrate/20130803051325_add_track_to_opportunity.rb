class AddTrackToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :track, :string
  end
end
