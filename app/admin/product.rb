# encoding: UTF-8
ActiveAdmin.register Product do

  permit_params :name, :price, :region_id, :city_id, :manufactur_id, :product_photos_attributes

  collection_action :autocomplete_product_name, :method => :get

  controller do
    autocomplete :product, :name, :full => true
    def index
      redirect_to root_url
    end
    def permitted_params
      params.permit product: [:name, :price, :region_id, :city_id, :manufactur_id, :product_photo, :product_photos, product_photos_attributes: [:photo]]
    end
  end

  menu false

  show do |product|
    attributes_table do
      row :id
      row :name
      row :price
      row :city do
        product.city.name
      end
      row :region do
        product.region.name if product.region
      end
      row :manufacturer do
        product.manufactur.name if product.manufactur
      end
      row :photos do
        div :class => :product_photos do
          product.product_photos.each do |photo|
            span image_tag  photo.photo
          end
        end
      end
    end

  end

  form multipart: true do |f|

    @cities = City.all
    @photos
    if params[:id]
      product = Product.find params[:id]
      product
      @cities = City.where(:region_id => product.region_id).all if product.region_id
      @photos = product.product_photos
    end

    f.inputs do
      f.input :name, :label => 'Название товара', :as => :autocomplete, :url => autocomplete_product_name_products_path
      f.input :price, :label => 'Цена товара'
    end
    f.inputs do
      f.input :region_id, :label => 'Область', :as => :select, :collection => Region.all.map{|c| [c.name, c.id]}
      f.input :city_id, :label => 'Город', :as => :select, :collection => @cities.map{|c| [c.name, c.id]}
      f.input :manufactur_id, :label => 'Производитель', :as => :select, :collection => Manufactur.all.map{|c| [c.name, c.id]}
    end

    f.has_many :product_photos  do |p|
      p.input :photo, :as => :file, :label => 'Image',:hint => p.template.image_tag(p.object.photo)
      p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
    end

    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
