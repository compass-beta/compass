class CreateTagToCards < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_to_cards do |t|
      t.integer :card_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
