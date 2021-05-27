class QuestionsController < ApplicationController

    def index
    end

    def new
        puts "question#new params"
        puts params
        @survey_id = params[:survey_id]
        @question_quantity = Survey.find(@survey_id).question_count.to_i
    end

    def create
        puts "question#create params:"
        puts params
        @survey = Survey.find(params[:survey_id])

        if @survey.update(questions_attributes: questions_params)
            redirect_to survey_path(@survey)
        else
            @question_quantity = @survey.question_count.to_i
            @survey_id = params[:survey_id]
            render action: :new
        end
    end

    private
    
    def questions_params
        params.permit(questions: [:content]).require(:questions)
    end

end
