class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :prefecture_name, null: false, default: ""
      t.integer :area_id, null: false, default: ""
      t.timestamps
    end
  end
end
