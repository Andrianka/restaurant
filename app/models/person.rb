require 'rubygems'
require 'role_model'
class Person < ActiveRecord::Base
  include RoleModel

  belongs_to :user

  roles_attribute :roles_mask
  roles :manager, :client, :cook, :waiter, :boss

  validates :roles, presence: true

end
