class StockArticle < ActiveRecord::Base
  has_many :placements, dependent: :destroy
  has_many :locations, through: :placements
end
