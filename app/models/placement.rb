class Placement < ActiveRecord::Base
  belongs_to :location
  belongs_to :stock_article

  # TODO Přidat validace
end
