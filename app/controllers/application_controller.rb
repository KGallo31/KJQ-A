class ApplicationController < ActionController::API
    include ActionController::Cookies
    # Since this is in ApplicationController every controller runs this method beforehand
    before_action :authorize

    # Checks if user is logged in based on cookies
    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end
end
