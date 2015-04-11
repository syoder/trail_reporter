json.reports @reports do |report|
  json.extract! report, :id, :latitude, :longitude, :description,
    :reported_at, :category_id, :trail_id, :user_id
end

json.linked do
  json.categories Category.all do |category|
    json.extract! category, :id, :name
  end
  json.trails Trail.all do |trail|
    json.extract! trail, :id, :name
  end
  json.users @reports.map(&:user).uniq.compact do |user|
    json.extract! user, :id, :trail_name
  end
end
