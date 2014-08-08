class UpdateLocations < ActiveRecord::Migration
  def change
    change_column(:locations, :lat, :string, limit:40)
    change_column(:locations, :long, :string, limit:40)
  end
end
