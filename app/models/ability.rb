class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.user_type == 'admin'
        can [:manage], User
        can [:manage], Box
        can [:manage], Client
        can [:manage], EnablePerson
        can [:manage], Reservation
        can [:manage], Boat
      elsif user.user_type == 'operador'
        can [:manage], Box
        can [:new], Reservation
        can [:edit], Reservation
        can [:update], EnablePerson
      elsif user.user_type == 'user' and !user.client.nil?
        can [:new], Reservation
        can [:manage], Boat
        can [:manage], EnablePerson
      end
    end
    # if user.present?  # additional permissions for logged in users (they can manage their posts)
      # can :manage, User, user_id: user.id
      # can [:read], Product
      # cannot :new, User
      # can [:new], Order
      # cannot [:read], Admin
    # elsif admin.present? # additional permissions for administrators
       # can [:manage], Product
       # can [:manage], User
       # can [:read], Order
       # can [:manage], Admin
    # else
        # can [:invite], Product
        # cannot [:invite], User
        # can [:new], Order
        # cannot [:invite], Admin
    # end
    # if user.admin?
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
