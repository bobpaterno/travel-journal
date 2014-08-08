class Location < ActiveRecord::Base
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :lat
  validates_presence_of :long
end
