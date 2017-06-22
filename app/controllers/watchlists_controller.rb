class WatchlistsController < ApplicationController
  #before_action :set_watchlist, only: [:show, :edit, :update, :destroy]

  # Similar to everyone, stop the method and remove cookies
  protect_from_forgery with: :null_session
  before_action :destroy_session

  # Getting the JSON before head
  before_action :parse_request, only: :create

  # GET /watchlists
  # GET /watchlists.json
  def index
    #@watchlists = Watchlist.all
    render json: Watchlist.all
  end

  # GET /watchlists/1
  # GET /watchlists/1.json
  #def show
  #end

  # GET /watchlists/new
  #def new
  #  @watchlist = Watchlist.new
  #end

  # GET /watchlists/1/edit
  #def edit
  #end

  # POST /watchlists
  # POST /watchlists.json
  def create
    #@watchlist = Watchlist.new(watchlist_params)

    #respond_to do |format|
    #  if @watchlist.save
    #    format.html { redirect_to @watchlist, notice: 'Watchlist was successfully created.' }
    #    format.json { render :show, status: :created, location: @watchlist }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @watchlist.errors, status: :unprocessable_entity }
    #  end
    #end

    @watchlist = Watchlist.new(@json['watchlist'])
    if @watchlist.save
      render json: @watchlist
    else
      #ERROR 500
      render nothing: true, status: :internal_server_error
    end #END if

  end #END create

  # PATCH/PUT /watchlists/1
  # PATCH/PUT /watchlists/1.json
  #def update
  #  respond_to do |format|
  #    if @watchlist.update(watchlist_params)
  #      format.html { redirect_to @watchlist, notice: 'Watchlist was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @watchlist }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @watchlist.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /watchlists/1
  # DELETE /watchlists/1.json
  def destroy
    @watchlist.destroy
    respond_to do |format|
      format.html { redirect_to watchlists_url, notice: 'Watchlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # This method is to read the input of JSON
    def parse_request
      @json = JSON.parse(request.body.read)
    end

    # This method to skip cookies on Session
    def destroy_session
      request.session_options[:skip] = true
    end

    # Use callbacks to share common setup or constraints between actions.
    #def set_watchlist
    #  @watchlist = Watchlist.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def watchlist_params
    #  params.require(:watchlist).permit(:user_id, :post_id)
    #end

end
