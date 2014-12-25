class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title, :slug, unique: true
      t.text :description

      t.timestamps null: false
    end
  end
end
