class Landmark < ActiveRecord::Base
  validates_presence_of :name
end
