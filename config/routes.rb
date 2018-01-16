Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/meta'

  get 'static_pages/teams'

  get 'static_pages/leaderboards'

  get 'static_pages/members'

  get 'static_pages/help'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
