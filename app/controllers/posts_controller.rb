class PostsController < ApplicationController
 # Because this is an API controller, we need to change a few things and stop the protect_from_forgery method
  # and need to remove cookies as well. These will raise exceptions if you hit the endpoints and they are not turned off.
  protect_from_forgery with: :null_session
  before_action :destroy_session
  

  # Before executing any method, get the JSON out of it:
  before_action :parse_request, only: :create


  #Ben's section
  def index
  	render json: Post.all
  end

# Create a new pet based on parameters provided.
  def create
    @post = Post.new(@json['post'])

    if @post.save
      render json: @post
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
