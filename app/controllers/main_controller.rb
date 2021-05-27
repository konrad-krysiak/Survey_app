class MainController < ApplicationController
    def index
    	@surveys = Survey.all
    end
end
