# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  attr_reader  :post

  def initialize(user, post)
    super(user, post)
    @post = record
  end

  def admin_list?
    user.admin?
  end
  
  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.moderator? || record.try(:user) == user
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  unless PostPolicy.new(current_user, @post).update?
    raise Pundit::NotAuthorizedError, "not allowed to update? this #{@post.inspect}"
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
