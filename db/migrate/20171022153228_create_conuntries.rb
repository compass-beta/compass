class CreateConuntries < ActiveRecord::Migration[5.0]
  def change
    create_table :conuntries do |t|

      t.timestamps
    end
  end
end
