RsFeedAggregator::Application.routes.draw do
  root :to => 'topics#index'
  resources :topics
  get '/search' => 'topics#search', :as => :search

  get    '/tags/:id'   => 'tags#show',  :as => :tag
  get    '/tags'       => 'tags#new' ,  :as => :new_tag
  post   '/tags'       => 'tags#create'
  delete '/tags/:id'   => 'tags#destroy'
end
