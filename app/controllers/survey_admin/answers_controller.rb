class SurveyAdmin::AnswersController < SurveyAdmin::BaseController
  helper_method :survey_properties

  def index
    @question   = Question.find(params[:question_id])
    @answers    = @question.answers.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @question   = Question.find(params[:question_id])
    @answer     = @question.answers.new
    @survey_image = @answer.survey_images.build
    form_info
  end

  def create
    @question   = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      redirect_to [:survey_admin, @answer.question, @answer], :notice => "Successfully created answer."
    else
      @survey_image = @answer.survey_images.build
      form_info
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @survey_image = @answer.survey_images.empty? ? @answer.survey_images.build : @answer.survey_images.first
    form_info
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to [:survey_admin, @answer.question, @answer], :notice  => "Successfully updated answer."
    else
      @survey_image = @answer.survey_images.empty? ? @answer.survey_images.build : @answer.survey_images.first
      form_info
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.active = false
    @answer.save
    redirect_to survey_admin_question_answers_url(@answer.question), :notice => "Successfully inactivated answer."
  end

  private
    def survey_properties
      @survey_properties ||= SurveyProperty.all.map{|sp| [sp.name, sp.id]}
    end

    def form_info

    end
end
