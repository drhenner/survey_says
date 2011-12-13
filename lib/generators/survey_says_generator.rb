#To invoke this generator, you just need to do:
# $ rails generate survey_says

#require 'rails/generators/migration'

module SurveySays
  class SurveySaysGenerator < Rails::Generators::Base
    desc "This generator creates survey_says/* in your app/assets/ directory"
    def create_survey_says_assets
      ########################   MOVE JAVASCRIPT to MAIN app
      original_js = File.binread("#{Rails.root}/app/assets/javascripts/application.js")
      if original_js.include?("require 'survey_says'")
         say_status("skipped", "insert into app/assets/javascripts/application.js", :yellow)
      else
         insert_into_file "#{Rails.root}/app/assets/javascripts/application.js", :after => %r{//= require ['"]?jquery['"]?\n} do
            "\n//= require \./survey_says\n\n"
         end
      end

      #########################   MOVE CSS to MAIN app
      original_css = File.binread("#{Rails.root}/app/assets/stylesheets/application.css")
      if original_css.include?("require 'survey_says'")
         say_status("skipped", "insert into app/assets/stylesheets/application.css", :yellow)
      else
         insert_into_file "#{Rails.root}/app/assets/stylesheets/application.css", :after => "*/" do
            "\n//= require 'survey_says'\n\n"
         end
      end

    end

    #include Rails::Generators::Migration

  end
end


=begin
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "20111208181247_create_questions.rb", "db/migrate/20111208181247_create_questions.rb"
        migration_template "create_something_else.rb", "db/migrate/create_something_else.rb"
      end

    end
  end
=end
