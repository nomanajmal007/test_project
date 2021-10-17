class UsersController < ApplicationController
  
    before_action :set_user, only: %i[ show edit update destroy]
    

    def index
      @users=User.all
      @user=User.new
      authorize @users 
    end

    def show
      @users=User.all
      @business=Business.all
      @task=Task.all
    end

    def get_businesses
      @users=User.all
      @businesses = Business.users(params[:make])
      render :update do |page|
      page.replace_html('getbusinessesdiv', :partial => 'getbusinesses')
      end
    end

    def new
      @user=User.new
    end

    def create
      
      @user = User.create!(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: "User was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.business_users.destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      end
    end


    private
    def set_user
        @user = User.find(params[:id])
      end

    def user_params
      params.require(:user).permit(:name, :email, :user_type, :password, :password_confirmation)
    end


end
