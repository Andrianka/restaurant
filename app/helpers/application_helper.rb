module ApplicationHelper

  def notification(msg)
    @action = msg[:action]
    @el = msg[:el]
    @el_old = msg[:el_old]
    @msg_type = msg[:msg_type]
  end

  def notification_order_status(msg)
    notification(msg)
    content = "#{current_user.full_name_or_email} #{@action} <a href=order_path(#{@el.id})>#{@el.title}</a> from #{@el.status} to #{@el_old.status}"
    Notification.create(msg_type: @msg_type, content: content, user_id: current_user.id, order_id: @el.id)
  end

  def notification_order(msg)
    notification(msg)
    content = "#{current_user.full_name_or_email} #{@action} <a href=order_path(#{@el.id})>#{@el.title}</a>"
    Notification.create(msg_type: @msg_type, content: content, user_id: current_user.id, order_id: @el.id)
  end
end
