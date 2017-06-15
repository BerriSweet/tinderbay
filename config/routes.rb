Rails.application.routes.draw do

  get 'homepage/index'

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
				        
        delete '/:id', to: 'users#destroy'
      end

      scope "products" do 
        #index page gettto
        get '/', to: 'products#index'
                
        #create page
        post '/', to: 'products#create' 
				
        #delete products
        delete '/:id', to: 'products#destroy'
      end
            
      scope "posts" do
        #index page getttto
        get '/', to: 'posts#index'
                
        #create page
        post '/', to: 'posts#create'
      end
    end
  end

  get 'login/index'
  
  get 'productsdetail/index'

  get 'account/index'

  resources :posts
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'
end
