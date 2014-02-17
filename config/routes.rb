RsFeedAggregator::Application.routes.draw do
  root 'topics#index'
  resources :topics
  resources :rsses

  #post     '/rsses/:id/rsses', :to => 'rsses#create'
  #get     '/rsses/new'       => 'rsses#new'
  #delete  '/rsses/:id'       => 'rsses#destroy'
end
