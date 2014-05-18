class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.references :product, index: true
      t.string :photo

      t.timestamps
    end
  end
end
