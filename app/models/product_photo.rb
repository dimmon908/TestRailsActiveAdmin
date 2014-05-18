class ProductPhoto < ActiveRecord::Base
  mount_uploader :photo, AvatarUploader
  belongs_to :product

  validates_presence_of :photo, :product_id
end
