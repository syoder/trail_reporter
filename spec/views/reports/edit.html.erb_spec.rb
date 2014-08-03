require 'rails_helper'

RSpec.describe "reports/edit", :type => :view do
  before(:each) do
    @report = assign(:report, Report.create!(latitude: 0, longitude: 0, description: "blah"))
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(@report), "post" do
    end
  end
end
