class Hall < ActiveRecord::Base
  belongs_to :storage
  belongs_to :user
  has_many :locations #, dependent: :destroy - testovaci ucely

  after_create :create_cells

  def create_cells
    #
  end
end
