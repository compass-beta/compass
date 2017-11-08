class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.string :vector_coord

      t.timestamps
    end
  end
end