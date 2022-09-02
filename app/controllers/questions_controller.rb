class QuestionsController < ApplicationController
    # Not doing anything right now
    
    require 'httparty'

    def getQuestion
        response = HTTParty.get('https://opentdb.com/api.php?amount=1&type=boolean')
        render json: response
    end
end