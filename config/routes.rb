Rails.application.routes.draw do
  scope '(:locale)' do
    resources :events
    get 'home/index'
    root 'home#index'
  end  
end
