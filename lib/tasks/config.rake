namespace :config do

  task :prepare do
    require 'fileutils'

    # TODO: I'm sure that rails provides helper methods for these values
    #       somewhere, but I don't remember what they are.
    root_path = File.absolute_path(File.join(__FILE__, "..", "..", ".."))
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