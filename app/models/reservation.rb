class Reservation < ActiveRecord::Base
  belongs_to :table
  belongs_to :user
  belongs_to :order

  validates :release_at, presence: true
  validates :table_id, presence: true

  Statuses = [New = 'New', Accepted = 'Accepted', Declined = 'Declined']

  scope :declined, -> { where(status: Reservation::Declined)}
  scope :active, -> { where.not(status: Reservation::Declined)}
  scope :accepted, -> { where(status: Reservation::Accepted)}
  scope :finished, -> {where('release_at < ?', DateTime.now)}
  scope :today, -> {where('release_at.to_date = ?', DateTime.now.to_date)}
  scope :today_finished,
    -> {where('release_at < ? && release_at.to_date = ?', DateTime.now, DateTime.now.to_date)}
  scope :today_future,
    -> {where('release_at > ? && release_at.to_date = ?', DateTime.now, DateTime.now.to_date)}
  scope :future, -> {where('release_at.to_date > ?', DateTime.now.to_date)}
  scope 'order?', -> {where('order_id IS NOT NULL')}
end
