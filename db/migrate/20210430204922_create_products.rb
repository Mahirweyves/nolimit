class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :address
      t.string :price
      t.text :description
      t.string :company_name
      t.string :telephone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
