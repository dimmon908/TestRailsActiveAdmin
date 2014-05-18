class CreateCities < ActiveRecord::Migration
  def change
    create_table :city do |t|
      t.string :name
      t.references :region, index: true

      t.timestamps
    end

    City.create([
                  {:name => 'test_1_1', :region_id => 1,},
                  {:name => 'test_1_2', :region_id => 2,},
                  {:name => 'test_1_3', :region_id => 3,},
                  {:name => 'test_1_4', :region_id => 4,},
                  {:name => 'test_1_5', :region_id => 5,},
                  {:name => 'test_2_1', :region_id => 2,},
                  {:name => 'test_2_2', :region_id => 2,},
                  {:name => 'test_2_3', :region_id => 2,},
                  {:name => 'test_3_1', :region_id => 3,},
                  {:name => 'test_3_2', :region_id => 3,},
                  {:name => 'test_3_3', :region_id => 3,},
                  {:name => 'test_3_4', :region_id => 3,}
                ])


  end
end
