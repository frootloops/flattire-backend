class AddLatitudeAndLongitudeToDrivers < ActiveRecord::Migration[5.0]

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

  private 

  def add_earthdistance_index table_name, options = {}
    execute "CREATE INDEX %s_earthdistance_ix ON %s USING gist (ll_to_earth(%s, %s));" %
      [table_name, table_name, 'latitude', 'longitude']
  end

  def remove_earthdistance_index table_name
    execute "DROP INDEX %s_earthdistance_ix;" % [table_name]
  end

end
