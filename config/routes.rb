Rails.application.routes.draw do
  resources :notebooks do
    resources :pages do
      resources :paragraphs
      resources :image_elements
    end
  end
  devise_for :users
  root to: "home#index"
end
