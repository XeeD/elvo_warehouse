class Hall < ActiveRecord::Base
  belongs_to :storage
  belongs_to :user
  has_many :locations

  after_create :create_cells

  def create_cells

  end
end
