class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :product_description
      t.float :price

      t.timestamps
    end
  end
end
