# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :create, [Question, Answer, Comment]
        can :update, [Question, Answer], user: user
      end
    else
      can :read, :all
    end
  end
end
