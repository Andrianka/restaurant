class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end

  def manage
    @notifications = Notification.all
    @users = User.all
  end
end
