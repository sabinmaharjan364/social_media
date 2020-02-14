class PagesController < ApplicationController
  
  def home
  end

  def hostel
    
    search = params[:query].present? ? params[:query] : nil
    @hostels = if search
      # Hostel.where("title LIKE ?", "%#{search}%")
      Hostel.search search
    else
      Hostel.all
    end
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
