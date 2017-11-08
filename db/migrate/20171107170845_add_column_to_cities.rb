class AddColumnToCities < ActiveRecord::Migration[5.0]
  def change
  	add_column :cities, :city_en, :string, after: :city
  end
end
