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
    #  @user.writingbroker? ?  @business.owner == @user : @user.admin?
    #@user.writingbroker? || @user.support? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

    if @user.admin?
      true
    elsif @user.support? || @user.writingbroker?
      @business.business_users.where(user_id:  @user.id).present?
    end


  end

  def destroy?
    @user.admin? || @user.writingbroker?
  end


end
