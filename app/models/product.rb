class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items

  validates :name, presence: true
  validates :category, presence: true

end
