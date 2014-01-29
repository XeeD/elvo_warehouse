class AddNameToStockArticles < ActiveRecord::Migration
  def change
    add_column :stock_articles, :name, :string
  end
end
