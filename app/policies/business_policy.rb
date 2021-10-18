class BusinessPolicy < ApplicationPolicy
  def initialize(user, business)
    @user = user
    @business = business
  end

  class Scope < Scope
    def resolve
      # some scope
    end

    def resolve_show
      #scope for show action 
      # E.g scope.all
    end
  end

  def index?
    true
  end



  def new?
    @user.admin? || @user.writingbroker?
  end


  def edit?
    check
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
    check
  end

  private
  def check
    if @user.admin?
      true
    elsif @user.writingbroker?
      @business.business_users.where(user_id:  @user.id).present?
    end
  end

end
