class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.integer :company_id
      t.string  :name
      t.text    :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
