class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :city_lat
      t.string :city_lng
      t.string :name

      t.timestamps
    end
  end
end
