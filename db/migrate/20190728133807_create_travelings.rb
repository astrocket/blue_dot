class CreateTravelings < ActiveRecord::Migration[6.0]
  def change
    create_table :travelings do |t|
      t.references :world, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.integer :visit_count, default: 1

      t.timestamps
    end
  end
end
