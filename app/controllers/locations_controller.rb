class LocationsController < ApplicationController
  def new

  end

  def create
    @hall = Hall.find(params[:hall_id])
    @location = @hall.locations.new(location_params)
    if @location.save
      redirect_to hall_url(@hall), notice: 'Location created'
    else
      render 'halls/show'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy
      redirect_to halls_path, notice: 'Location destroyed'
    end
  end

  private
  def location_params
    params.require(:location).permit(:id, :name, :selection_start_x, :selection_start_y, :selection_end_x, :selection_end_y, :location_type)
  end
end
