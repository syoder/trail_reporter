class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :report
      t.references :user
      t.text :subject
      t.text :body
      t.timestamps
    end
  end
end
