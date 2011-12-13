Rails.application.routes.draw do

  match 'survey_admin' => 'survey_admin/questionnaires#index'

  namespace(:survey_admin){ resources :questionnaires }

  namespace(:survey_admin){ resources :survey_properties }

  #namespace(:survey_admin){ resources :answers }

  root :to => "survey_admin/questions#index"
  namespace :survey_admin do
    resources :questions do
      resources :answers
    end
  end
end
