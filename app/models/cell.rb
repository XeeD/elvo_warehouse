class Cell < ActiveRecord::Base
  belongs_to :hall
  belongs_to :location
end
