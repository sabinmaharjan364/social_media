class Hostel < ApplicationRecord
  searchkick
  belongs_to :user
  has_many :comments
  mount_uploader :avatar, AvatarUploader

  def search_data
    {
      name: name
    }
  end

end
