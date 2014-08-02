require 'rails_helper'

RSpec.describe "reports/index", :type => :view do
  before(:each) do
    assign(:reports, [
      Report.create!(latitude: 0, longitude: 0, description: "blah"),
      Report.create!(latitude: 0, longitude: 0, description: "blah")
    ])
  end

  it "renders a list of reports" do
    render
  end
end
