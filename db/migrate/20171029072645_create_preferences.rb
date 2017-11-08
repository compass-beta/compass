class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.integer :city_id
      t.integer :occupation_id
      t.integer :job_id
      t.integer :interest_id
      t.string :start_trip_day

      t.timestamps
    end
  end
end
