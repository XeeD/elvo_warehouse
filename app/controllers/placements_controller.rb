class PlacementsController < ApplicationController
  def new
    @stock_article = StockArticle.find(params[:stock_article_id])
    @placement = @stock_article.placements.new
  end

  def create
    @stock_article = StockArticle.find(params[:stock_article_id])
    @placement = @stock_article.placements.new(placement_params)
    if @placement.save
      redirect_to pending_placements_url, notice: 'Placement created'
    else
      redirect_to pending_placements_url, notice: 'Placement creation failed'
      # raise?
    end
  end

  def update

  end


  protected

  def placement_params
    params.require(:placement).permit(:location_id, :stock_article_id, :quantity)
  end
end
