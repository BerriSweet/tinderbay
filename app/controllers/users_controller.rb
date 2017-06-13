class UsersController < ApplicationController

  #JEFFS PART

    #Because this is an API controller, we need to change a few things and stop the protect_from_forgery method
    #and need to remove cookies as well. These will raise exceptions if you hit the endpoints and they are not turned off.
    protect_from_forgery with: :null_session
    before_action :destroy_session

    #before executing any method, get JSON
    before_action :parse_request, only: :create

    # #before executing create
    # before_action only: :create do
    #   unless @json.has_key?('user') &&
    #     @json.respond_to?(:[])

    #     render json: nil, status: :bad_request
    #   else
    #     unless @json['user']['user_name'] &&
    #       @json['user']['date_of_birth'] &&
    #       @json['user']['password_digest'] &&
    #       @json['user']['email'] &&
    #       @json['user']['is_admin']

    #       redner json: nil, status: :unprocessed_entity
    #     end
    #   end
    # end

    #Render index
    def index
      render json: User.all
    end

    #Create a new user based on paremeters provided
    def create
      @user = User.new(@json["user"])

      if @user.save
        render json: @user
      else
        #internal error, 500
        render nothing: true, status: :internal_server_error
      end
    end

    #read the json input
    def parse_request
      @json = JSON.parse(request.body.read)
    end

    #skip the session cookie
    def destroy_session
      request.session_options[:skip] = true
    end
	
	# CALLUM'S SECTION
	# destroy user
	def destroy
		id = params[:id]
		u_destroy = User.find(id)
		u_destroy.destroy
		render json: u_destroy

	end
  
end
