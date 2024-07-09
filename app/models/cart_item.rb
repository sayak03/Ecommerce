class CartItem < ApplicationRecord
  belongs_to :admin
  belongs_to :product

  validates :product_id, uniqueness: { scope: :admin_id }
end
