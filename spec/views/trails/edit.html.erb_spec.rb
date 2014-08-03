require 'rails_helper'

RSpec.describe "trails/edit", :type => :view do
  before(:each) do
    @trail = assign(:trail, Trail.create!(name: "Somewhere"))
  end

  it "renders the edit trail form" do
    render

    assert_select "form[action=?][method=?]", trail_path(@trail), "post" do
    end
  end
end
