Rails.application.routes.draw do
  #namespace(:survey_admin){ resources :answers }

  root :to => "survey_admin/questions#index"
  namespace :survey_admin do
    resources :questions do
      resources :answers
    end
  end
end
