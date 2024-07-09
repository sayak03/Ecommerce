# class for product migration
class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
