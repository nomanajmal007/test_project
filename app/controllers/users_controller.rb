class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy]

    def index
        @users=User.all
    end

    def show
        @users=User.all
        @business=Business.all
    end

    private
    def set_user
        @user = User.find(params[:id])
      end

    def user_params
      params.require(:user).permit(:name, :email, :user_ids)
    end


end
