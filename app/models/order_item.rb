class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validate :available_quantity
  validates :order, presence: true
  validates :product, presence: true

  attr_accessor :category

  def available_quantity
    if self.quantity <= self.product.quantity
      self.errors.add(:quantity, " - Please order only what's available")
    end
  end
end
