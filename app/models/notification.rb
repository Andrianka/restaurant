class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  
  Type = [
    Error = 'error',
    Notice = 'notice',
    Alert = 'alert',
    Success = 'success'
  ]
end
