class Hall < ActiveRecord::Base
  belongs_to :storage
  belongs_to :user
  has_many :locations #, dependent: :destroy
  has_many :cells #, dependent: :destroy

  after_create :create_cells

  def create_cells
    @cells = Cell.new
    #self.°    #@cells.hall_id
    #@cells.width
    # ??
  end
end