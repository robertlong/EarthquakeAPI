class EarthquakesController < ApplicationController
  def index

    @earthquakes = Earthquake.all

    if params[:on]
       @earthquakes = @earthquakes.where()
    end

    if params[:since]
       @earthquakes = @earthquakes.where()
    end

    if params[:over]
      @earthquakes = @earthquakes.where()
    end

    if params[:near]
      @earthquakes = @earthquakes.where()
    end

    respond_to do |format|
      format.json { render :json => params}
    end
  end
end
