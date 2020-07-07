Rails.application.routes.draw do
  resources :says do
    collection do
      post :confirm
    end
  end
end
