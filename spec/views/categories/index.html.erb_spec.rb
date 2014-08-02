require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, [
      Category.create!(name: "Something"),
      Category.create!(name: "Something Else")
    ])
  end

  it "renders a list of categories" do
    render
  end
end
