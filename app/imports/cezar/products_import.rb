require 'csv'

module Cezar
  class ProductsImport
    def initialize(csv)
      @csv = csv
    end

    def import
      headers_skipped = false
      CSV.parse(@csv, col_sep: ";", headers: [:cezar_id, :stock_type, :ean_code, :name, :quantity, :ordered_quantity, :weight, :size]) do |row|
        unless headers_skipped
          headers_skipped = true
          next
        end

        article_relation = StockArticle.where(cezar_id: row[:cezar_id], stock_type: row[:stock_type])
        article_attributes = {
            :cezar_id => row[:cezar_id],
            :stock_type => row[:stock_type],
            :ean_code => row[:ean_code],
            :name => row[:name],
            :quantity => row[:quantity],
            :ordered_quantity => row[:ordered_quantity],
            :weight => row[:weight],
            :size => row[:size]
        }

        create_or_update article_relation, article_attributes
      end
    end


    private

    def create_or_update(article_relation, article_attributes)
      if article_relation.length > 0
        article_relation.first.update_attributes(article_attributes)
      else
        article_relation.create(article_attributes)
      end
    end
  end
end

__END__

Cezar::ProductsImport.new(csv).import
