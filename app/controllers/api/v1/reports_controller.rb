class Api::V1::ReportsController < ApplicationController

  # CURL example:
  #   curl "localhost:3000/api/v1/reports?radius_miles=5&lat38.835161=&lng=-77.311821"
  #
  def index
    @reports = Report.within(params[:radius_miles], origin: filter_location)
  end

  private

    def filter_location
      [params[:lat].to_f, params[:lng].to_f]
    end
end
