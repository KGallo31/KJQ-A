class SessionsController < ApplicationController

    def login 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: {error: 'Invalid Username or Password'}, status: :unauthorized
        end
    end

end
