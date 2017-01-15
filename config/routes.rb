AbakTest1::Application.routes.draw do
  root to: 'home#index'
  get '/*names', to: 'home#index'
  post '/*names', to: 'home#index'
  put '/*names', to: 'home#index'
end
