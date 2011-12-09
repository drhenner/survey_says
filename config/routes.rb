Rails.application.routes.draw do
  root :to => "survey_admin/questions#index"
  namespace :survey_admin do
    resources :questions
  end
end
