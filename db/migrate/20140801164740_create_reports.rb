class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :latitude
      t.float :longitude
      t.string :description
      t.timestamp :reported_at

      t.timestamps
    end
  end
end
