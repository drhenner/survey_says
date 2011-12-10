class SurveyAdmin::AnswersController < ApplicationController
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
    form_info
  end

  def create
    @question   = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      redirect_to [:survey_admin, @answer.question, @answer], :notice => "Successfully created answer."
    else
      form_info
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    form_info
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to [:survey_admin, @answer.question, @answer], :notice  => "Successfully updated answer."
    else
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
    def form_info

    end
end
