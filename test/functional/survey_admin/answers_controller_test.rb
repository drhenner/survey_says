require 'test_helper'

class SurveyAdmin::AnswersControllerTest < ActionController::TestCase
  def test_index
    @question = Factory(:question)
    @answer = Factory(:answer, :question => @question)
    get :index, :question_id => @question.id
    assert_template 'index'
  end

  def test_show
    @question = Factory(:question)
    @answer = Factory(:answer, :question => @question)
    get :show, :id => @answer.id, :question_id => @question.id
    assert_template 'show'
  end

  def test_new
    @question = Factory(:question)
    @answer = Factory(:answer, :question => @question)
    get :new, :question_id => @question.id
    assert_template 'new'
  end

  def test_create_invalid
    @question = Factory(:question)
    @answer = Factory(:answer, :question => @question)
    Answer.any_instance.stubs(:valid?).returns(false)
    post :create, :question_id => @question.id
    assert_template 'new'
  end

  def test_create_valid
    @question = Factory(:question)
    @answer = Factory(:answer, :question => @question)
    Answer.any_instance.stubs(:valid?).returns(true)
    post :create, :question_id => @question.id
    assert_redirected_to survey_admin_question_answer_url(assigns(:answer).question ,assigns(:answer))
  end

  def test_edit
    @question = Factory(:question)
    @answer = Factory(:answer, :question => @question)
    get :edit, :id => @answer.id, :question_id => @question.id
    assert_template 'edit'
  end

  def test_update_invalid
    @question = FactoryGirl.create(:question)
    puts @question.inspect
    @answer = Factory(:answer, :question => @question)
    Answer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @answer.id, :question_id => @question.id
    assert_template 'edit'
  end

  def test_update_valid
    @question = FactoryGirl.create(:question)
    @answer = Factory(:answer, :question => @question)
    Answer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @answer.id, :question_id => @question.id
    assert_redirected_to survey_admin_question_answer_url(assigns(:answer).question,assigns(:answer))
  end

  def test_destroy
    @question = Factory(:question)
    answer = Factory(:answer, :question => @question)
    delete :destroy, :id => answer, :question_id => @question.id
    assert_redirected_to survey_admin_question_answers_url(@question)
    assert !Answer.find(answer.id).active
  end
end
