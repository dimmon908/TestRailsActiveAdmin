class City < ActiveRecord::Base
  self.table_name = :city
  belongs_to :region
end
