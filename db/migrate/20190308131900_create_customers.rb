class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :avatar
      t.string :oauth_token
      t.string :mobile
      t.text :bio
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
