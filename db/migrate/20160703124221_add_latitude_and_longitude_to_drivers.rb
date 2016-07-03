class AddLatitudeAndLongitudeToDrivers < ActiveRecord::Migration[5.0]
  include Earthdistanceable

  def up
    add_column :drivers, :latitude, :float
    add_column :drivers, :longitude, :float

    add_earthdistance_index :drivers
  end

  def down
    remove_earthdistance_index :drivers

    remove_column :drivers, :latitude
    remove_column :drivers, :longitude
  end

end
