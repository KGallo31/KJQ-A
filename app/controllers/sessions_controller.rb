class SessionsController < ApplicationController
    # Allows user to login without being logged in 
    # Expempting the login route from the before action
    skip_before_action :authorize, only: [:login]

    def login 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: {error: 'Invalid Username or Password'}, status: :unauthorized
        end
    end

    # def current
    #     binding.pry
    #     if (session[:user_id]) 
    #         user = User.find_by(id: session[:user_id])
    #         render json: user
    #     else
    #         render json: {error: 'Not logged in'}, status: :unauthorized
    #     end
    # end

end
