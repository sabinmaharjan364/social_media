class Hostel < ApplicationRecord
  searchkick
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  def search_data
    {
      name: name
    }
  end

end
