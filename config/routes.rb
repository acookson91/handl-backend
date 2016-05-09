Rails.application.routes.draw do
  scope '/api' do
    mount_devise_token_auth_for 'User', at: '/auth'
    resources :groups, except: [:new, :edit]
  end
  
   resources :deliveries

   root 'deliveries#index'

   match '*any' => 'application#options', :via => [:options]
end
