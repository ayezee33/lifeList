Rails.application.routes.draw do
  resources :lists do
    resources :goals do
    end
  end
  
  get 'marketing/index'

   root 'marketing#index'

end
