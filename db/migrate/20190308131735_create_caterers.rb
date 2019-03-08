class CreateCaterers < ActiveRecord::Migration[5.1]
  def change
    create_table :caterers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :mobile_1
      t.string :mobile_2
      t.string :mobile_3
      t.string :tel_1
      t.string :tel_2
      t.string :tel_3
      t.string :code
      t.string :logo
      t.string :uid
      t.string :verified
      t.string :location
      t.string :resend
      t.text :tagline

      t.timestamps
    end
  end
end
