class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    order  = Order.create!(book_id: @book.id, amount: @book.price, state: :pending)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: :paid).find(params[:id])
  end
end
