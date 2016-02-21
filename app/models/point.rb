class Point < ActiveRecord::Base
  scope :active, -> { where(is_active: true).first }
end
