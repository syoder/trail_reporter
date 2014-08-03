require 'rails_helper'

RSpec.describe "trails/show", :type => :view do
  before(:each) do
    @trail = assign(:trail, Trail.create!(name: "Somewhere"))
  end

  it "renders attributes in <p>" do
    render
  end
end
