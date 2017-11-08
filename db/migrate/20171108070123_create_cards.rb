class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :city
      t.string :country
      t.string :address
      t.float :latitude, comment: "緯度"
      t.float :longitude, comment: "経度"
      t.string :txt_file_url
      t.string :eye_catch_url
      t.string :img_file_url_1
      t.string :img_file_url_2
      t.string :img_file_url_3
      t.string :img_file_url_4
      t.string :img_file_url_5
      t.boolean :show_flag, default: true, comment: "true: 表示, false: 非表示"
      t.integer :card_type, default: 0, comment: "0: なし, 1: 場所, 2: ニュース, 3: コラム, 4: 記事, 5: イベント, 6: ツアー"

      t.timestamps
    end
  end
end
