class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ""
      t.string :body, null: false, default: ""
      t.integer :user_id, null: false, default: ""
      t.timestamps
    end
  end
end
