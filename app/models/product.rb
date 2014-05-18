class Product < ActiveRecord::Base
  belongs_to :city
  belongs_to :region
  belongs_to :manufactur

  has_many :product_photos, :dependent => :destroy
  accepts_nested_attributes_for :product_photos

  validates_presence_of :name
  validates_presence_of :price, :format => { :with => /^(\$)?(\d+)(\.|,)?\d{0,2}?$/ }
  validates_presence_of :city
end
