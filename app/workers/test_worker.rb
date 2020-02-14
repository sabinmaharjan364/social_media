class TestWorker
  include Sidekiq::Worker

  def perform(hostel_id)
    hostel = Hostel.find_by_id(hostel_id)
    hostel.dashboard_count = 1
    hostel.save
  end
end
