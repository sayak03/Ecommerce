# frozen_string_literal: true

# Class for Products controller
class CartsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @cart_items = current_admin.cart_items.includes(:product)
  end

  def create
    product = Product.find(params[:product_id])
    cart_item = current_admin.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = cart_item.quantity.to_i + 1
    cart_item.save
    redirect_to cart_path, notice: 'Product added to cart.'
  end

  def destroy
    cart_item = current_admin.cart_items.find_by(product_id: params[:product_id])
    cart_item&.destroy
    redirect_to cart_path, notice: 'Product remove from cart.'
  end

  def update
    cart_item = current_admin.cart_items.find_by(product_id: params[:product_id])
    if cart_item && params[:quantity].to_i.positive?
      cart_item.update(quantity: params[:quantity])
    elsif cart_item
      cart_item.destroy
    end
    redirect_to cart_path
  end
  def check_cart
    if current_admin.cart_items.any?
      redirect_to cart_path
    else
      redirect_to products_path, notice: 'Cart is empty, please add items.'
    end
  end
end
