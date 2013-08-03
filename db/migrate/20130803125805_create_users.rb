class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :img_url
      t.string :oath_token
      t.datetime :oath_expires_at

      t.timestamps
    end
  end
end
