class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  accepts_nested_attributes_for :order_items

  validates :user, presence: true
  validates :status, presence: true

  before_create :set_order_status
  before_save :update_subtotal

  Statuses = [
            Reservation = "Reservation",
            New = "New",
            InProgress = "InProgress",
            Done = "Done",
            Payed = "Payed",
            Closed = "Closed"
            ]

  scope :draft, -> { where.not(status: Order::New) }
  scope :anew, -> { where(status: Order::New) }
  scope :inprogress, -> { where(status: Order::InProgress) }
  scope :done, -> { where(status: Order::Done) }
  scope :payed, -> { where(status: Order::Payed) }
  scope :closed, -> { where(status: Order::Closed) }
  scope :reservation, -> { where(status: Order::Reservation) }
  
  def subtotal
    self.order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
  def set_order_status
    self.status = Order::New
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
