class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show update destroy ]ses
  # Gems for http request for ruby 
  require 'pry'
  require 'httparty'
  require 'json'
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # I set this at the /me route 
  # Gets the current user using cookies and gets a random question
  # This works because of a before_action call inherited from application controller
  # Its checks if there is a user before anything else can be done 
  def start
    user = User.find_by(id: session[:user_id])
    # Making a get request to external API to get a random question
    response = HTTParty.get('https://opentdb.com/api.php?amount=1&type=boolean')
    render json: {"user" => user,"results" => response["results"]},status: :ok
  end


  # GET /users/1
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user, status: :ok
    else
      render json: {error: 'Not found'}, status: 404
    end
  end

  # POST /users
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
    # user = User.create!(user_params)
    # # session[:user_id] = user.id
    # render json: user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :password_confirmation, :score)
    end
end
