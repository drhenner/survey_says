class SurveyAdmin::QuestionsController < SurveyAdmin::BaseController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.includes(:answers).find(params[:id])
  end

  def new
    form_info
    @question = Question.new
    #@question.answers.build# = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to survey_admin_question_url(@question)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated question."
      redirect_to survey_admin_question_url(@question)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.active = false
    @question.save
    flash[:notice] = "Successfully inactivated."
    redirect_to survey_admin_questions_url
  end

  private

  def form_info

  end
end
