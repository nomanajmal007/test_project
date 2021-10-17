class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    true
  end



  def new?
    @user.admin? || @user.writingbroker?
  end


  def edit?
    @user.admin? || @user.writingbroker?
  end


  def show?
    @user.admin? || @user.writingbroker? || @user.support?

  end

  def destroy?
    @user.admin? || @user.writingbroker?
  end

  private
  def check
  end


end
