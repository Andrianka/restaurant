class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  accepts_nested_attributes_for :order_items

  validates :user, presence: true
  validates :status, presence: true

  attr_accessor :sum

  Statuses = [
            Reservation = "Reservation",
            New = "New",
            InProgress = "InProgress",
            Done = "Done",
            Payed = "Payed",
            Closed = "Closed"
            ]

  def sum_price
    sum = 0
    self.order_items.map {
      |i| sum_price += i.price
    }
    return sum
  end
end
