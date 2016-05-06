Rails.application.routes.draw do

  root 'paintings#index'

  resources :paintings

  delete 'paintings/all', :as => 'delete_all'

end
