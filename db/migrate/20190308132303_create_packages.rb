class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :guests
      t.integer :price
      t.string :location
      t.text :design_amenities
      t.text :other_amenities
      t.text :policy
      t.text :terms
      t.integer :downpayment
      t.string :mode_of_payment
      t.text :food
      t.integer :caterer_id
      t.integer :views
      t.integer :appearances
      t.string :remember_policy
      t.string :remember_terms
      t.string :remember_payment
      t.string :i1
      t.string :i2
      t.string :i3
      t.string :i4
      t.string :i5
      t.string :i6
      t.string :i7
      t.string :i8
      t.string :i9
      t.string :i10
      t.string :category

      t.timestamps
    end
  end
end
