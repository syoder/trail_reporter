require 'rails_helper'

RSpec.describe "trails/index", :type => :view do
  before(:each) do
    assign(:trails, [
      Trail.create!(name: "Somewhere"),
      Trail.create!(name: "Somewhere else")
    ])
  end

  it "renders a list of trails" do
    render
  end
end
