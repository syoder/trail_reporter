class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :description
      t.timestamp :reported_at

      t.references :category
      t.references :trail
      t.references :user

      t.timestamps
    end
  end
end
