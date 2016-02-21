class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :reservations
  has_many :notifications
  has_one  :person, dependent: :destroy

  accepts_nested_attributes_for :person

  def full_name_or_email
    if self.person
      "#{self.person.try(:first_name)} #{self.person.try(:last_name)}"
    else
      self.email
    end
  end

end
