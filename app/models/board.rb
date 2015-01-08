class Board < ActiveRecord::Base
  has_many :pins, dependent: :destroy
  belongs_to :user

  validates :title, presence: true

  searchable do
  	text :title, :description
  	integer :user_id
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged,:finders]

  def self.search_board(search_key)
  	@search = self.search do
  		fulltext "#{search_key}"
  	end
  	@search.results
  end
end