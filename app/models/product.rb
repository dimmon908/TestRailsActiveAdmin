class Product < ActiveRecord::Base
  PHOTO_LIMIT = 8
  belongs_to :city
  belongs_to :region
  belongs_to :manufactur

  has_many :product_photos, :dependent => :destroy
  accepts_nested_attributes_for :product_photos

  before_validation :photo_in_bounds

  validates_presence_of :name
  validates_presence_of :price, :format => { :with => /^(\$)?(\d+)(\.|,)?\d{0,2}?$/ }
  validates_presence_of :city



private
  def photo_in_bounds
    return true unless self.album
    if self.product_photos.count >= PHOTO_LIMIT
      errors.add(:product_photos, :exceeded_quota)
    end
  end


end
