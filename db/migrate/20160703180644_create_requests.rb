class CreateRequests < ActiveRecord::Migration[5.0]
  def up
    create_table :requests do |t|
      t.references :driver, foreign_key: true
      t.integer :status, default: 0, null: false
      t.text :address, null: false, default: ""
      t.text :cause, null: false, default: ""
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
    
    add_earthdistance_index :requests
  end

  def down
    remove_earthdistance_index :requests

    drop_table :requests
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
