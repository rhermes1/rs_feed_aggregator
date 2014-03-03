RsFeedAggregator::Application.routes.draw do
  root :to => 'topics#index'
  resources :topics
  resources :tags
  get '/search' => 'topics#search', :as => :search

end
