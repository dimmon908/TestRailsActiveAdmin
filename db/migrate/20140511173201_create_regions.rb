class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name

      t.timestamps
    end

    Region.create([
                    {:name => 'test01'},
                    {:name => 'test02'},
                    {:name => 'test03'}
                  ])
  end
end
