RsFeedAggregator::Application.routes.draw do
  root :to => 'topics#index'
  resources :topics
  get '/search' => 'topics#search', :as => :search
end
