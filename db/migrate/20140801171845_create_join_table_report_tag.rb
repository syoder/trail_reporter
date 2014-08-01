class CreateJoinTableReportTag < ActiveRecord::Migration
  def change
    create_join_table :reports, :tags do |t|
      t.index [:report_id, :tag_id]
      t.index [:tag_id, :report_id]
    end
  end
end
