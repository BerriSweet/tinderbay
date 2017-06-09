Rails.application.routes.draw do

  get 'products/index'

  get 'products/create'

	# Base for API Urls
	scope 'api' do

		scope 'v1' do

			scope 'sales' do

				#index page geto
 				get '/', to: 'sales#index'

 				#create page
  				post '/', to: 'sales#create'
  			end

      scope "users" do
        #index page getto
        get '/', to: 'users#index'

        #create page
          post '/', to: 'users#create'
        end

        scope "products" do #index page geto
          get '/', to: 'products#index'
          post '/', to: 'products#create' #create page
        end
      end
  	end

  resources :posts
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
