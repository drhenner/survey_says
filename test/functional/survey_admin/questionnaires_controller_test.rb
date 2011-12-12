require 'test_helper'

class SurveyAdmin::QuestionnairesControllerTest < ActionController::TestCase
  def test_index
    questionnaire = Factory(:questionnaire)
    get :index
    assert_template 'index'
  end

  def test_show
    questionnaire = Factory(:questionnaire)
    get :show, :id => questionnaire.id
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Questionnaire.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Questionnaire.any_instance.stubs(:valid?).returns(true)
    post :create, :questionnaire => { :name => 'Johnny!'}
    assert_redirected_to survey_admin_questionnaire_url(assigns(:questionnaire))
  end

  def test_edit
    questionnaire = Factory(:questionnaire)
    get :edit, :id => questionnaire.id
    assert_template 'edit'
  end

  def test_update_invalid
    questionnaire = Factory(:questionnaire)
    Questionnaire.any_instance.stubs(:valid?).returns(false)
    put :update, :id => questionnaire.id
    assert_template 'edit'
  end

  def test_update_valid
    questionnaire = Factory(:questionnaire)
    Questionnaire.any_instance.stubs(:valid?).returns(true)
    put :update, :id => questionnaire.id
    assert_redirected_to survey_admin_questionnaire_url(assigns(:questionnaire))
  end
end
