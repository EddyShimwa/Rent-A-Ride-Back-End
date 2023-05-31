class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :model
      t.string :description
      t.integer :rating
      t.decimal :price, precision: 10, scale: 2
      t.decimal :rent_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
