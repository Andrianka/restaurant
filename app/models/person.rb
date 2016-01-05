require 'rubygems'
require 'role_model'
class Person < ActiveRecord::Base
  include RoleModel

  belongs_to :user

  roles_attribute :roles_mask
  roles :manager, :client, :cook, :waiter, :boss
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
