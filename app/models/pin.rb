class Pin < ActiveRecord::Base
  belongs_to :board

  searchable do
  	text :name, :image
  	integer :board_id
  end

  mount_uploader :image, ImageUploader

  paginates_per 30

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

	def self.search_pin(search_key)
		@search = self.search do
			fulltext "#{search_key}"
		end
		@search.results
	end
end
