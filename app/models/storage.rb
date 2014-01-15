class Storage < ActiveRecord::Base
  has_many :halls
  belongs_to :user
end