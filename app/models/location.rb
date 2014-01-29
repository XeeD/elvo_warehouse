# TODO Vyresit min a max souradnice výběru
class Location < ActiveRecord::Base
  belongs_to :hall
  has_many :cells, dependent: :nullify
  has_many :placements, dependent: :destroy
  has_many :stock_articles, through: :placements

  enum location_type: [:ground, :rack]

  after_create :assign_cells
  before_create :compute_capacity


  protected

  def assign_cells
    Cell.where(
        "coordinate_x >= ? AND coordinate_y >= ? AND coordinate_x <= ? AND coordinate_y <= ?",
        selection_start_x,
        selection_start_y,
        selection_end_x,
        selection_end_y
    ).update_all(location_id: self.id)
  end

  def compute_capacity
    self.capacity = default_cell_capacity * (selection_end_x - selection_start_x + 1) * (selection_end_y - selection_start_y + 1)
  end

  def default_cell_capacity
    case location_type
      when 'ground' then 2
      else nil
    end
  end

end
