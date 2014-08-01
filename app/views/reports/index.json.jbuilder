json.array!(@reports) do |report|
  json.extract! report, :id, :latitude, :longitude, :description, :reported_at
  json.url report_url(report, format: :json)
end
