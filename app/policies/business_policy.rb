class BusinessPolicy < ApplicationPolicy
  def initialize(user, business)
    @user = user
    @business = business
  end

  def index?
    @user.admin? || @user.writingbroker?
  end



  def new?
    @user.admin? || @user.writingbroker?
  end


  def edit?

  end


  def show?
    #  @user.writingbroker? ?  @business.owner == @user : @user.admin?
     @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  end

  def destroy?
  end



end
