class CreateRequests < ActiveRecord::Migration[5.0]
  include Earthdistanceable

  def up
    create_table :requests do |t|
      t.references :driver, foreign_key: true
      t.integer :status, default: 0, null: false
      t.text :address, null: false, default: ""
      t.text :cause, null: false, default: ""
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :icon, null: false, default: "🚗"

      t.timestamps
    end
    
    add_earthdistance_index :requests
  end

  def down
    remove_earthdistance_index :requests

    drop_table :requests
  end

end
