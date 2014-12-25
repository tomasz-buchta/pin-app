class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :name, :slug, unique: true
      t.string :image
      t.references :board, index: true

      t.timestamps null: false
    end
    add_foreign_key :pins, :boards
  end
end
