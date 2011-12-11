class SurveyAdmin::SurveyPropertiesController < SurveyAdmin::BaseController
  def index
    @survey_properties = SurveyProperty.all
  end

  def show
    @survey_property = SurveyProperty.find(params[:id])
  end

  def new
    @survey_property = SurveyProperty.new
    form_info
  end

  def create
    @survey_property = SurveyProperty.new(params[:survey_property])
    if @survey_property.save
      redirect_to [:survey_admin, @survey_property], :notice => "Successfully created survey property."
    else
      form_info
      render :new
    end
  end

  def edit
    @survey_property = SurveyProperty.find(params[:id])
    form_info
  end

  def update
    @survey_property = SurveyProperty.find(params[:id])
    if @survey_property.update_attributes(params[:survey_property])
      redirect_to [:survey_admin, @survey_property], :notice  => "Successfully updated survey property."
    else
      form_info
      render :edit
    end
  end

  def destroy
    @survey_property = SurveyProperty.find(params[:id])
    @survey_property.destroy
    redirect_to survey_admin_survey_properties_url, :notice => "Successfully destroyed survey property."
  end

  private
    def form_info

    end
end
