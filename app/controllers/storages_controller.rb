class StoragesController < ApplicationController
  def index
    @storages = Storage.all
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(app_params) # Tady se musi pouzit params.require (viz app_params) - attr_accessible nefunguje
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

    if @storage.update_attributes(app_params)
      redirect_to storages_path
    end
  end

  private
  def app_params
    params.require(:storage).permit(:id, :name, :updated_at, :created_at)
  end
end
