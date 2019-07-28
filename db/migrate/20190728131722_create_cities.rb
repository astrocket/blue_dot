class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, index: true
      t.string :name_ascii
      t.string :lat
      t.string :lng
      t.string :country, index: true
      t.string :iso2, index: true
      t.string :iso3, index: true
      t.string :admin_name
      t.string :capital
      t.string :population
      t.string :simple_map_id

      t.timestamps
    end
  end
end
