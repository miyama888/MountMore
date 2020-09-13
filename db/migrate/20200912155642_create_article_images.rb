class CreateArticleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :article_images do |t|
      t.string :image_id, null: false, default: ""
      t.integer :article_id, null: false
      t.timestamps
    end
  end
end
