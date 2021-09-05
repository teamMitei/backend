class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.float :latitude
      t.float :longitude
      t.integer :rank

      t.timestamps
    end
  end
end
