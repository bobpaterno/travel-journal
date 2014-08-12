class UpdateLandmarks < ActiveRecord::Migration
  def change
    add_reference(:landmarks, :location, index: true)
  end
end
