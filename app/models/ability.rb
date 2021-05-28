# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, :all

    if user.present?  # additional permissions for logged in users (they can read their own posts)
      can :destroy, Post , user_id: user.id
      can :edit, Post , user_id: user.id
      can :new, Post , user_id: user.id
      can :create, Post , user_id: user.id
      can :update, Post , user_id: user.id
    end
  end
end
