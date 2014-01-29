class StockArticle < ActiveRecord::Base
  has_many :placements, dependent: :destroy
  has_many :locations, through: :placements

  def quantity_placed
    placements.sum(:quantity)
  end
end
