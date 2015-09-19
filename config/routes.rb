Rails.application.routes.draw do

  resources :patients, param: :patient_id

  resources :patients, only: [] do
    resources :backgrounds, param: :background_id
    resources :laboratories, param: :laboratory_id
    resources :pregnancies, param: :pregnancy_id
  end

  resources :patients, only: [] do
    resources :pregnancies, only: [] do
      resources :controls, param: :control_id
    end
  end

  root 'patients#index'
end