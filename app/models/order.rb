class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  accepts_nested_attributes_for :order_items

  Statuses = [
            Reservation = "Reservation",
            New = "New",
            InProgress = "InProgress",
            Done = "Done",
            Payed = "Payed",
            Closed = "Closed"
            ]
end
