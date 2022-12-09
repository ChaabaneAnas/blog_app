class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    if user.role?
      can :manage, :all
    elsif user.present?
      can :manage, Post, user: user
      can :manage, Comment, user: user
    else
      can :read, :all
    end
  end
end
