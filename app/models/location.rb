class Location < ActiveRecord::Base
  belongs_to :hall
  has_many :cells, dependent: :destroy
end