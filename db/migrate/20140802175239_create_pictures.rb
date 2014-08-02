class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
      t.references :user, index: true

      t.timestamps
    end
  end
end
