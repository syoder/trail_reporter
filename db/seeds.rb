# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

%w(admin reporter).each do |role_name|
  Role.where(name: role_name).first_or_create
end

trail_names = ["Appalachian Trail", "Tuscarora Trail", "Pacific Crest Trail", "C & O Canal Towpath", "Great Allegheny Passage"]
trail_names.each do |trail_name|
  Trail.where(name: trail_name).first_or_create
end
