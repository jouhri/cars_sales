class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :price
      t.integer :year
      t.string :brand
      t.string :engine
      t.string :color
      t.string :name

      t.timestamps null: false
    end
  end
end
