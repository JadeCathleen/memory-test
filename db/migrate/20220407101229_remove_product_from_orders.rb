class RemoveProductFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :product, null: false, foreign_key: true
  end
end
