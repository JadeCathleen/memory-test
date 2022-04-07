class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :country
      t.string :customer_code

      t.timestamps
    end
  end
end
