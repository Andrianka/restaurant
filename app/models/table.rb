class Table < ActiveRecord::Base
  has_many :reservations
  has_many :orders
  validates :nr, presence: true
  validates :quantity, presence: true

end
