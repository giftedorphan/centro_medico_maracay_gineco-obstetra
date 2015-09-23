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
      resources :images, param: :image_id
    end
  end

  get 'search' => 'patients#search'

  root 'patients#index'
end