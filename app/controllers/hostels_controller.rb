class HostelsController < ApplicationController

  def show
    @hostel = Hostel.find_by_id(params[:id])
  end

end
