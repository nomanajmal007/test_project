class BusinessPolicy < ApplicationPolicy
  def initialize(user, business)
    @user = user
    @business = business
  end

  def index?
    @user.admin? || @user.writingbroker? || @user.support?
  end



  def new?
    @user.admin? || @user.writingbroker?
  end


  def edit?
    check
  end

  def destroy?
    check
  end


  def show?
    check
    #  @user.writingbroker? ?  @business.owner == @user : @user.admin?
    #@user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?
    # if @user.writingbroker?  || 
    #   if @business.business_users.where(user_id:  @user.id).present? 
    #     true
    #   end
    #   if @business.owner == @user
    #     true
    #   end
    # end

  end

  def destroy?
  end


  private

  def check
    @user.writingbroker? ? @business.business_users.where(user_id:  @user.id).present? : @user.admin?
  end



end
