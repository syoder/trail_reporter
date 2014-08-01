json.array!(@trails) do |trail|
  json.extract! trail, :id
  json.url trail_url(trail, format: :json)
end
