require 'test_helper'

class SurveyAdmin::SurveyPropertiesControllerTest < ActionController::TestCase
  def test_index
    @survey_property = Factory(:survey_property)
    get :index
    assert_template 'index'
  end

  def test_show
    @survey_property = Factory(:survey_property)
    get :show, :id => @survey_property.id
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SurveyProperty.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SurveyProperty.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to survey_admin_survey_property_url(assigns(:survey_property))
  end

  def test_edit
    @survey_property = Factory(:survey_property)
    get :edit, :id => @survey_property.id
    assert_template 'edit'
  end

  def test_update_invalid
    @survey_property = Factory(:survey_property)
    SurveyProperty.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @survey_property.id
    assert_template 'edit'
  end

  def test_update_valid
    @survey_property = Factory(:survey_property)
    SurveyProperty.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @survey_property.id
    assert_redirected_to survey_admin_survey_property_url(assigns(:survey_property))
  end

  def test_destroy
    survey_property = Factory(:survey_property)
    delete :destroy, :id => survey_property
    assert_redirected_to survey_admin_survey_properties_url
    assert !SurveyProperty.exists?(survey_property.id)
  end
end
