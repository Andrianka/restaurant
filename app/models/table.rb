class Table < ActiveRecord::Base
  has_many :reservations

  validates :nr, presence: true
  validates :quantity, presence: true

end
