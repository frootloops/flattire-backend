module Earthdistanceable
  extend ActiveSupport::Concern

  def add_earthdistance_index table_name, options = {}
    execute "CREATE INDEX %s_earthdistance_ix ON %s USING gist (ll_to_earth(%s, %s));" %
      [table_name, table_name, 'latitude', 'longitude']
  end

  def remove_earthdistance_index table_name
    execute "DROP INDEX %s_earthdistance_ix;" % [table_name]
  end

end
