class RecreateOldThumbnails < ActiveRecord::Migration
  def up
  	Pin.all.each do |p|
  		p.image.recreate_versions! if p.image
  	end
  end

  def down
  end
  
end
