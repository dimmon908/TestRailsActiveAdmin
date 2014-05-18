class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :city, index: true
      t.references :region, index: true

      t.timestamps
    end
  end
end
