class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ""
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :area_id, null: false
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
