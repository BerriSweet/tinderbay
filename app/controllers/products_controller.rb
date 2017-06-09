class ProductsController < ApplicationController
	#JACK'S SECTION
  protect_from_forgery with: :null_session
  before_action :destroy_session

  # Before executing any method, get the JSON out of it:
  before_action :parse_request, only: :create
     
def index
    render json: Product.all
end

  # Create a new pet based on parameters provided.
  def create
    @product = Product.new(@json['product'])

    if @product.save
      render json: @product
    else
      # Internal Server Error, 500.
      render nothing: true, status: :internal_server_error
    end
  end

  private

  # Read the JSON input.
  def parse_request
  	puts request.body.read
    @json = JSON.parse(request.body.read)
  end

  # Skip the Session cookie.
  def destroy_session
    request.session_options[:skip] = true
  end
end