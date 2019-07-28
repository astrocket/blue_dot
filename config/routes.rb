Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticate :admin_user do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :api do

  end

  scope :app do
    resources :worlds, param: :url_suffix
  end

  scope '/:url_suffix', constraints: { url_suffix: World::ROUTER_REGEX } do
    get '/' => 'worlds#show', as: :world_page
  end

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  root 'worlds#index'
end
