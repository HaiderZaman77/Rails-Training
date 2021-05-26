# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, :all

    if user.present?  # additional permissions for logged in users (they can read their own posts)
      can :read, Post, user_id: user.id
      can :destroy, Post , user_id: user.id
    end
  end
end
