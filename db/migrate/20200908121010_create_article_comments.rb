class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :article_id, null: false, default: ""
      t.string :comment, null: false, default: ""
      t.timestamps
    end
  end
end
