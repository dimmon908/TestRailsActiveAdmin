class ProductController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page], :per_page => params[:per_page])
  end

  def new

  end

  def create

  end

  def update
    product = Product.find params[:id]
    if product.update_attributes(params[:product])
      render :json => product
    else
      render :json => product.errors
    end
  end
end
