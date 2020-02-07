class PagesController < ApplicationController
  
  def home
  end

  def hostel
    @hostels = Hostel.all
  end

  def show
    @hostel = Hostel.find_by_id(params[:id])
  end
end
