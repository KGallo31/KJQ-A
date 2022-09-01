class SessionsController < ApplicationController

    def login 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            binding.pry
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
