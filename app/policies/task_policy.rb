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
    true
    # if @user.admin?
    #   true
    # elsif @user.support? || @user.writingbroker?
    #   Business.find(@task.business_id).business_users.where(user_id:  @user.id).present?
    # end

  end

  def destroy?
    @user.admin? || @user.writingbroker?
  end

  private
  def check
  end


end
