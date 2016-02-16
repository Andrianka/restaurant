module ApplicationHelper

  def pagination_links(collection, options = {})
   options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
   options[:class] ||= 'pagination pagination-centered'
   options[:inner_window] ||= 2
   options[:outer_window] ||= 1
   will_paginate(collection, options)
  end

  def notification(msg)
    @action = msg[:action]
    @el = msg[:el]
    @el_old = msg[:el_old]
    @msg_type = msg[:msg]
  end

  def notification_order_status(msg)
    notification(msg)
    content = "#{current_user.full_name_or_email} #{@action} <a class='btn btn-link' href=orders/#{@el.id}>#{@el.title}</a> from #{@el.status} to #{@el_old.status}"
    Notification.create(msg_type: @msg_type, content: content, user_id: current_user.id, order_id: @el.id)
  end

  def notification_order(msg)
    notification(msg)
    content = "#{current_user.full_name_or_email} #{@action} <a href=orders/#{@el.id}>#{@el.title}</a>"
    Notification.create(msg_type: @msg_type, content: content, user_id: current_user.id, order_id: @el.id)
  end
end
