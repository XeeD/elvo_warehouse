class HallsController < ApplicationController
  def index
    @halls = Hall.all #.where(user_id: current_user.id)
  end

  def new
    @halls = Hall.new
    @storages = Storage.all.where(user_id: current_user.id)
  end

  def create
    @halls = Hall.new(app_params)
    @halls.user_id = current_user.id
    if @halls.save
      redirect_to halls_path, notice: 'Hall was created'
    end
  end

  private
  def app_params
    params.require(:hall).permit(:id, :name, :storage_id, :updated_at, :created_at)
  end
end
