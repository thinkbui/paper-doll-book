Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"

  resources :books do

    member do
      get 'page_contents'
    end

    resources :book_pages

    resources :layers do
      resources :layer_pages
    end

  end
end
