class Landmark < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :name
  validates_uniqueness_of :name, message: "already exists"
end
