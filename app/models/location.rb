class Location < ActiveRecord::Base
  belongs_to :hall
  has_many :cells, dependent: :nullify # nullify nastavi foreign keys na nil - slozitejsi akce mozne pres :after_destroy
  has_many :placements, dependent: :destroy
  has_many :stock_articles, through: :placements

  after_create :assign_cells


  def assign_cells
    Cell.where(
        "coordinate_x >= ? AND coordinate_y >= ? AND coordinate_x <= ? AND coordinate_y <= ?",
        selection_start_x,
        selection_start_y,
        selection_end_x,
        selection_end_y
    ).update_all(location_id: self.id)
  end

end
