class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    protect_from_forgery prepend: true
    include DeviseWhitelist
    include CurrentUserConcern
    include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
