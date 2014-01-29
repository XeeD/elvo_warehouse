class PendingPlacementsController < ApplicationController
  def index
    @stock_articles = StockArticle.
        where('stock_articles.quantity > 0').
        includes(:placements).
        references(:placements).
        select('stock_articles.*').
        group('placements.id, stock_articles.id').
        having('SUM(placements.quantity) < stock_articles.quantity OR placements.id IS NULL').
        paginate(page: params[:page], per_page: 25)
  end
end
