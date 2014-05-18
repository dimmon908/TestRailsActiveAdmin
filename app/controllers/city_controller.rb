class CityController < ApplicationController

  def cities
    begin
      if params[:id]
        @city = City.where(:region_id => params[:id]).all
      else
        @city = City.all
      end

      render :json => {:status => :ok, :city => @city}
    rescue Exception => e
      render :json => {:status => :error, :message => e.message}
    end
  end
end
