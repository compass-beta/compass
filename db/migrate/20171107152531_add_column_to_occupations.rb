class AddColumnToOccupations < ActiveRecord::Migration[5.0]
  def change
  	add_column :occupations, :occupation_en, :string, after: :occupation
  end
end
