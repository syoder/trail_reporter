class Api::V1::ReportsController < ApplicationController

  def index
    # TODO: filter by distance via lat/lng
    @reports = Report.all
  end
end
