class StoragesController < ApplicationController
  def index
    @storages = Storage.all.where(:user_id => current_user.id)
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(app_params) # Tady se musi pouzit params.require, attr_accessible nefunguje
    @storage.user_id = current_user.id
    if @storage.save
      redirect_to storages_path, notice: 'Storage created'
    else
      redirect_to new_storage_path, notice: 'Not created'
    end
  end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy
    redirect_to storages_path
  end

  def show
    @storage = Storage.find(params[:id])
  end

  def edit
    @storage = Storage.find(params[:id])
  end

  def update
    @storage = Storage.find(params[:id])
    @storage.name = params[:name]
    if @storage.save
      redirect_to storages_path
    end
  end

  private
  def app_params
    params.require(:storage).permit(:id, :name, :updated_at, :created_at)
  end
end