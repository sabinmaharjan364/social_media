class PagesController < ApplicationController
  
  def home
  end

  def hostel
    @hostels = Hostel.all
  end

  def show
    @hostel = Hostel.find_by_id(params[:id])
  end

  def search
    @hostels = Hostel.where("name LIKE ?", "%" + params[:q] + "%")
    # @hostels = nil
    # if params[:query]==""
    #   @hostels = nil
    # else
    #   if params[:query].length > 2
    #     like = '%'+ params[:query].downcase.concat("%")
    #     @hostels = Hostel.where("LOWER(name) LIKE ?", like)
    #   end
    # end
    # respond_to do |format|
    #   format.json  { render :json => @hostels }
    # end
  end

end
