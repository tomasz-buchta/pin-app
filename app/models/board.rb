class Board < ActiveRecord::Base

  has_many :pins, dependent: :destroy
  
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: [:slugged,:finders]

end