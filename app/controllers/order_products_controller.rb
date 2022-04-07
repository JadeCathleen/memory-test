class OrderProductsController < ApplicationController

  def index
    # @orders = Order.where(user: current_user)
    # @order_products = OrderProduct.where(order: Order.where(user: current_user))
    @order_products = OrderProduct.all
  end
end
