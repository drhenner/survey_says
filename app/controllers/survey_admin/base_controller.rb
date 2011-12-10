class SurveyAdmin::BaseController < ApplicationController
  layout 'survey_admin'
  before_filter :require_survey_admin

  private

    def require_survey_admin
      true
      #redirect_to login_url and return unless survey_admin?
    end

    def survey_admin?
      current_user && current_user.survey_admin?
    end
end