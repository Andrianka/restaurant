class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Person.new
    access_abilities(user.person)
  end

  def access_abilities(user)
    if user.has_role? :client
      can [:show, :index], [Product, Order]
      cannot :access, [Category, Table]
    end
    if user.has_role?  :waiter
      cannot [:edit, :destroy], [Category, Table, Product]
      cannot [:destroy], [Reservation]
      cannot [:profile], [User]
    end
    if user.has_role?  :cook
    end
    if user.has_role?  :manager
      # can :manage, :all
      can :access, [User]
      can :access, :action_index_user
    end
    if user.has_role?  :boss
      can :manage, :all
    end
  end
end
