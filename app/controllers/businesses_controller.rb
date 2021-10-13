class BusinessesController < ApplicationController
    before_action :set_business, only: %i[ show edit update destroy toggle_status]


    def index
        @businesses=Business.all
    end
    
    def show
    end


    def new
        @business=Business.new
    end

    def create
        @business = Business.new(business_params)

        respond_to do |format|
          if @business.save
            format.html { redirect_to @business, notice: "Business was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end


    def edit
    end

    def update
        respond_to do |format|
            if @business.update(business_params)
              format.html { redirect_to @business, notice: "Business was successfully updated." }
              format.json { render :show, status: :ok, location: @business }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @business.errors, status: :unprocessable_entity }
            end
          end
    end



    def destroy
        @business.destroy
        respond_to do |format|
          format.html { redirect_to businesses_url, notice: "Business was successfully destroyed." }
        end
    end


    private
    def set_business
        @business = Business.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def business_params
        params.require(:business).permit(:name, :description)
      end


end
