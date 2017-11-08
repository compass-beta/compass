class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :country
      t.string :area

      t.timestamps
    end
  end
end
