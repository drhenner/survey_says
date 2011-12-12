require 'test_helper'

class SurveyAdmin::QuestionsControllerTest < ActionController::TestCase
  #fixtures :questions

  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    question = Factory(:question)
    get :show, :id => question.id
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Question.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Question.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to survey_admin_question_answers_url(assigns(:question))
  end

  def test_edit
    question = Factory(:question)
    get :edit, :id => question.id
    assert_template 'edit'
  end

  def test_update_invalid
    question = Factory(:question)
    Question.any_instance.stubs(:valid?).returns(false)
    put :update, :id => question.id
    assert_template 'edit'
  end

  def test_update_valid
    question = Factory(:question)
    Question.any_instance.stubs(:valid?).returns(true)
    put :update, :id => question.id
    assert_redirected_to survey_admin_question_answers_url(assigns(:question))
  end

  def test_destroy
    question = Factory(:question)
    delete :destroy, :id => question.id
    assert_redirected_to survey_admin_questions_url
    assert Question.exists?(question.id)
    assert !Question.find(question.id).active
  end
end
