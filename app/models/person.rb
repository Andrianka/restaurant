require 'rubygems'
require 'role_model'
class Person < ActiveRecord::Base
  include RoleModel

  belongs_to :user

  roles_attribute :roles_mask
  roles :manager, :client, :cook, :waiter, :boss
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def full_name
    "#{self.first_name} #{self.last_name}".rstrip
  end

  def form_completed?(current_user)
    current_user.person.first_name.present? &&
    current_user.person.last_name.present? &&
    current_user.person.tel.present? ? true : false
  end
end
