class CreateManufacturs < ActiveRecord::Migration
  def change
    create_table :manufacturs do |t|
      t.string :name

      t.timestamps
    end

    add_column :products, :manufactur_id, :integer
    add_index :products, :manufactur_id

    Manufactur.create([
                        {:name => 'manufacturer_1'},
                        {:name => 'manufacturer_2'},
                        {:name => 'manufacturer_3'},
                        {:name => 'manufacturer_4'},
                        {:name => 'manufacturer_5'},
                        {:name => 'manufacturer_6'},
                        {:name => 'manufacturer_7'},
                        {:name => 'manufacturer_8'},
                        {:name => 'manufacturer_9'},
                      ])
  end
end
