class CreateStockArticles < ActiveRecord::Migration
  def change
    create_table :stock_articles do |t|
      t.string :cezar_id, null: false, limit: 30
      t.integer :stock_type, null: false
      t.integer :ean_code, limit: 8
      t.integer :quantity, null: false, default: 0
      t.integer :ordered_quantity, null: false, default: 0
      t.integer :weight
      t.integer :size

      t.timestamps
    end

    add_index :stock_articles, [:cezar_id, :stock_type], unique: true
  end
end
