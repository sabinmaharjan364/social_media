class User
  class HostelsController < ApplicationController
    before_action :authenticate_user!

    def index
      @products = Product.where(user_id: current_user.id)
    end

    def new
      @product = Product.new
    end

    def show
      @product = current_user.products.find_by_id(params[:id])
    end

    def create
      @product = current_user.products.new(product_params)
      
      if @product.save
        flash[:success] = "product created successfully"
        redirect_to edit_user_product_path(@product)
      else
        flash.now[:error] = "Something went wrong"
        render 'new'
      end
    end

    def edit
      @hostel = current_user.hostels.find_by_id(params[:id])
    end

    def update
      @hostel = current_user.hostels.find_by_id(params[:id])
      if @hostel.update_attributes(hostel_params)
        flash[:notice] = "Product updated successfully"
        redirect_to user_hostels_path
      else
        flash.now[:error] = "Something went wrong"
        render 'edit'
      end
    end

    def destroy
      @hostel = current_user.hostels.find_by_id(params[:id])
      if @hostel.destroy
        flash[:notice] = "Product was succesfully deleted"
        redirect_to user_hostels_path
      else
        flash[:error] = "Sorry Something went wrong"
        render "index"
      end
    end

    private

    def hostel_params
      params.require(:hostel).permit(:user_id,
                                      :product_name,
                                      :website,
                                      :twitter,
                                      :description,
                                      :about)
    end

  end
end
