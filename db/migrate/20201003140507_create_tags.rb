class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.decimal :score,  precision: 5, scale: 3
      t.integer :article_image_id
      t.timestamps
    end
  end
end
