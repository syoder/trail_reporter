class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :latitude
      t.float :longitude
      t.string :description
      t.timestamp :reported_at

      t.references :category
      t.references :trail
      t.references :user

      t.timestamps
    end
  end
end
