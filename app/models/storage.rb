class Storage < ActiveRecord::Base
  has_many :halls, dependent: :destroy
  belongs_to :user
end