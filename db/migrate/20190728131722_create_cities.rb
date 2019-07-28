class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :name_ascii
      t.string :lat
      t.string :lng
      t.string :country
      t.string :iso2
      t.string :iso3
      t.string :admin_name
      t.string :capital
      t.string :population
      t.string :simple_map_id

      t.timestamps
    end
  end
end
