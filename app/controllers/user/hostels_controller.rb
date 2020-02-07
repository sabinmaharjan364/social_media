class User
  class HostelsController < ApplicationController
    before_action :authenticate_user!
    skip_before_filter :verify_authenticity_token  

    def index
      @hostels = Hostel.where(user_id: current_user.id)
    end

    def new
      @hostel = Hostel.new
    end

    def show
      @hostel = current_user.hostels.find_by_id(params[:id])
    end

    def create
      @hostel = current_user.hostels.new(hostel_params)
      if @hostel.save
        flash[:success] = "hostel created successfully"
        redirect_to edit_user_hostel_path(@hostel)
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
        flash[:notice] = "Hostel updated successfully"
        redirect_to user_hostels_path
        # render 'new'
      else
        flash.now[:error] = "Something went wrong"
        render 'edit'
      end
    end

    def destroy
      @hostel = current_user.hostels.find_by_id(params[:id])
      if @hostel.destroy
        flash[:notice] = "Hostel was succesfully deleted"
        redirect_to user_hostels_path
      else
        flash[:error] = "Sorry Something went wrong"
        render "index"
      end
    end

    private

    def hostel_params
      params.require(:hostel).permit(:user_id,
                                      :name,
                                      :description,
                                      :avatar)
    end

  end
end
