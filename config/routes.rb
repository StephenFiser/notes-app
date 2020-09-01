Rails.application.routes.draw do
  resources :notebooks do
    resources :pages do
      resources :paragraphs
      resources :image_elements
      resources :checklists do
        resources :checklist_items
      end
    end
  end
  devise_for :users
  root to: "notebooks#index"
end
