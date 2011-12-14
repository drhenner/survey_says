#To invoke this generator, you just need to do:
# $ rails generate survey_says

#require 'rails/generators/migration'

module SurveyModels
  class SurveyModelsGenerator < Rails::Generators::Base
    desc "This generator creates survey_says/models/* in your app/models/ directory"
    def copy_models
      require 'fileutils'
      # FileUtils.cp source, dest
      puts "#{Dir.pwd}"
      Dir.foreach("#{Dir.pwd}../../app/models") do |x|
        if x.match(/(\.rb)/)
          unless File.exist?("#{Rails.root}/app/models/#{x}")
            puts "Moving #{x} to main app."
            FileUtils.cp "#{Dir.pwd}../../app/models/#{x}", "#{Rails.root}/app/models/#{x}"
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