class CreateTrailersTable < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :url
      t.timestamps
    end
  end
end
