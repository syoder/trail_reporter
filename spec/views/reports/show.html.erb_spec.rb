require 'rails_helper'

RSpec.describe "reports/show", :type => :view do
  before(:each) do
    @report = assign(:report, Report.create!(latitude: 0, longitude: 0, description: "blah"))
  end

  it "renders attributes in <p>" do
    render
  end
end
