#To invoke this generator, you just need to do:
# $ rails generate survey_says

class SurveySaysGenerator < Rails::Generators::Base
  desc "This generator creates survey_says/* in your app/assets/ directory"
  def create_survey_says_assets
    # create_file "config/initializers/initializer.rb", "# Add initialization content here"
    original_js = File.binread("app/assets/javascripts/application.js")
    if original_js.include?("require 'survey_says'")
       say_status("skipped", "insert into app/assets/javascripts/application.js", :yellow)
    else
       insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require ['"]?jquery['"]?\n} do
          "\n//= require \./survey_says\n\n"
       end
    end

    #########################
    original_css = File.binread("app/assets/stylesheets/application.css")
    if original_css.include?("require 'survey_says'")
       say_status("skipped", "insert into app/assets/stylesheets/application.css", :yellow)
    else
       insert_into_file "app/assets/stylesheets/application.css", :after => "*/" do
          "\n//= require 'survey_says'\n\n"
       end
    end

  end
end