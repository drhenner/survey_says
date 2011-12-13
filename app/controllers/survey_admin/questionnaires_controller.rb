class SurveyAdmin::QuestionnairesController < SurveyAdmin::BaseController
  def index
    @questionnaires = Questionnaire.all
  end

  def show
    @questionnaire = Questionnaire.includes(:questions).find(params[:id])
  end

  def new
    @questionnaire = Questionnaire.new
    form_info
  end

  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    if @questionnaire.save
      redirect_to [:survey_admin, @questionnaire], :notice => "Successfully created questionnaire."
    else
      form_info
      render :new
    end
  end

  def edit
    @questionnaire = Questionnaire.find(params[:id])
    form_info
  end

  def update
    @questionnaire = Questionnaire.find(params[:id])
    if @questionnaire.update_attributes(params[:questionnaire])
      redirect_to [:survey_admin, @questionnaire], :notice  => "Successfully updated questionnaire."
    else
      form_info
      render :edit
    end
  end

  private
    def form_info

    end
end
