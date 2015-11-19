Rails.application.routes.draw do
  resource :isikukood,
           controller: :isikukood,
           defaults: { format: :json },
           only: [] do
    get :random
    get :validate
    get :generate
  end

  root 'isikukood#index'
end
