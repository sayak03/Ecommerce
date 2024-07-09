# frozen_string_literal: true

# class for product model
class Product < ApplicationRecord
  has_many :cart_items
  has_many :admins, through: :cart_items
  # this for not added empty data
  validates :product_name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
