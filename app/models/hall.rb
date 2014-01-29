class Hall < ActiveRecord::Base
  belongs_to :storage
  belongs_to :user
  has_many :locations, dependent: :destroy
  has_many :cells, dependent: :destroy

  after_create :create_cells


  private

  def create_cells
    for y in 1..self.length
      for x in 1..self.width
        cells.create!(
            coordinate_x: x,
            coordinate_y: y
        )
      end
    end
  end
end
