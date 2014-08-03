namespace :config do

  task :prepare do
    require 'fileutils'

    root_path   = Rails.root
    config_path = File.join(root_path, "config")

    example_files = Dir[File.join(config_path, "*.example")]

    example_files.each do |ef|
      # Remove the ".example" extension
      dest = ef.gsub(/\.example$/, "")

      if File.exist? dest
        puts "File #{File.basename(dest).inspect} already exists.  Skipping..."

      else
        puts "Copying #{File.basename(ef).inspect} to #{File.basename(dest).inspect}"
        FileUtils.cp ef, dest
      end
    end
  end
  
end

# Travis-CI needs the database config to exist so that it can run unit tests.
# So, we add :"config:prepare" as an extra dependency to ensure this.
task :spec => :"config:prepare"
