class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail])

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @order.amount_cents,
      description:  "Paiement pour #{@order.book.title}, commande #{@order.id}",
      currency:     @order.amount.currency)

    @order.update(payment: charge.to_json, state: :paid)
    redirect_to order_path(@order)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = Order.where(state: :pending).find(params[:order_id])
  end
end
