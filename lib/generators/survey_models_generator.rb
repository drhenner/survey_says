#To invoke this generator, you just need to do:
# $ rails generate survey_says

#require 'rails/generators/migration'

module SurveyModels
  class SurveyModelsGenerator < Rails::Generators::Base
    desc "This generator creates survey_says/models/* in your app/models/ directory"
    def copy_models
      require 'fileutils'

      puts "#{File.dirname(__FILE__)}"
      file_path = "#{File.dirname(__FILE__)}"
      Dir.foreach( "#{file_path}/../../app/models" ) do |x|
      #Dir.glob("#{file_path}/../../app/models/*.rb") do |x|
        if x.match(/(\.rb)/)
          unless File.exist?("#{Rails.root}/../../app/models/#{x}")
            puts "Moving #{x} to main app."
            FileUtils.cp "#{file_path}/../../app/models/#{x}", "#{Rails.root}/app/models/#{x}"
          else
            puts '##################################'
            puts "app/models/#{x} already exists!"
            puts ''
            puts "Please manually move this model if this is the first time you have run this generator."
          end
        end
      end
    end
    #include Rails::Generators::Migration

  end
end