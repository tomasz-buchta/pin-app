class Pin < ActiveRecord::Base
  belongs_to :board

  mount_uploader :image, ImageUploader

  paginates_per 5


  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
