def random_latitude
  rand(29.0000..50.0000)
end

def random_longitude
  rand(-90.0000..-70.0000)
end

def random_datetime
  (DateTime.now).change(day: rand(1..10))
end


namespace :random do
  desc "Generate random reports"
  task :reports, [:count] => :environment do |t, args|
    count = args[:count].to_i
    count = 10 if count <= 0

    count.times do
      Report.create!(:latitude => random_latitude,
                     :longitude => random_longitude,
                     :description => 'description',
                     :reported_at => random_datetime)
    end
  end
end
