require 'rubygems'
require 'role_model'
class Person < ActiveRecord::Base
  include RoleModel

  roles_attribute :roles_mask
  roles :manager, :client, :cook, :waiter, :boss
end
