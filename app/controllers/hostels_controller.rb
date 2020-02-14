class HostelsController < ApplicationController

  def show
    @hostel = Hostel.find_by_id(params[:id])
    TestWorker.perform_async(@hostel.id)
  end

end
