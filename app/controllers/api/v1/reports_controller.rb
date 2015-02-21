class Api::V1::ReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # CURL example:
  #   curl "localhost:3000/api/v1/reports?radius_miles=5&lat38.835161=&lng=-77.311821"
  #
  def index
    @reports = Report.within(params[:radius_miles], origin: filter_location)
  end

  # CURL example (doesn't include auth headers!):
=begin
     curl -i \
       -H "Content-Type: application/json" \
       -X POST -d '{"reports": [{"latitude":38.835161,"longitude":-77.311821,"description":"created via curl"}]}' \
       "localhost:3000/api/v1/reports"
=end

  def current_user
    User.first
  end

  def create
    @reports = reports_params.map {|p| current_user.reports.build(p)}
    success = @reports.map {|report| report.save }
    if success.all?
      head :no_content
    else
      render json: {reports: @reports.map{|report| report.slice(:id, :latitude, :longitude, :errors)}},
        status: :unprocessable_entity
    end
  end

  private

    def reports_params
      params[:reports].map {|p| report_params(p)}
    end

    def report_params(params_hash)
      params_hash.permit(:latitude, :longitude, :description, :reported_at, :category_id, :trail_id)
    end

    def filter_location
      [params[:lat].to_f, params[:lng].to_f]
    end
end
