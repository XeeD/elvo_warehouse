class HallsController < ApplicationController
  def index
    @halls = Hall.all.where(user_id: current_user.id)
  end

  def new
    @hall = Hall.new
    @storages = Storage.all.where(user_id: current_user.id)
  end

  def create
    @halls = Hall.new(app_params)
    @halls.user_id = current_user.id
    if @halls.save
      redirect_to halls_path, notice: 'Hall was created'
    end
  end

  def show
    @hall = Hall.find(params[:id])
  end

  def edit
    @hall = Hall.find(params[:id])
    @storages = Storage.all.where(user_id: current_user.id)
  end

  def update
    @hall = Hall.find(params[:id])

    if @hall.update_attributes(app_params)
      redirect_to halls_path
    end
  end

  def destroy
    @hall = Hall.find(params[:id])
    if @hall.destroy
      redirect_to halls_path
    end
  end

  private
  def app_params
    params.require(:hall).permit(:id, :name, :storage_id, :updated_at, :created_at, :width, :length)
  end
end
