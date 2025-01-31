class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.string :model
      t.text :description
      t.string :brand
      t.string :color
      t.string :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
