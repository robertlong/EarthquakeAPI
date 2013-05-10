class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.integer :id
      t.string  :src, :limit => 2
      t.integer :version
      t.datetime :datetime
      t.float :lat
      t.float :lon
      t.float :magnitude
      t.float :depth
      t.float :nst
      t.string :region
    end
  end
end
