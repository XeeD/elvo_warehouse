class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.belongs_to :location, null: false
      t.belongs_to :stock_article, null: false
      t.integer :quantity, null: false

      t.index [:location_id, :stock_article_id], unique: true
      t.index :quantity
    end
  end
end
