# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# def upload_image
# end

#seed boards

5.times do |n|
	a = Board.new
	a.title = Faker::Commerce.product_name
	a.description = Faker::Lorem.sentences(1)
	a.save
end

files = Dir.glob("db/seed_images/*.jpg")

boards = Board.all

uploader = ImageUploader.new

boards.each do |board|
	50.times do |n|
		p = Pin.new
		p.name = Faker::Commerce.product_name
		p.board_id = board.id
		file_src = File.join Rails.root,files.sample
		p.image = File.new file_src#uploader.store!(File.open(files.sample))
		p.save
	end
end
