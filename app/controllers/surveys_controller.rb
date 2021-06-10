class SurveysController < ApplicationController
    def index
    end

    def new
    end

    def update
    end

    def create
        @survey = Survey.new(survey_params)
        if @survey.save
            redirect_to new_survey_question_path(@survey)
        else
            render "new"
        end
    end

    def show
        @survey = Survey.find(params[:id])
    end

    def destroy
        @survey = Survey.find(params[:id])
        @survey.answers.destroy_all
        @survey.questions.destroy_all
        @survey.destroy
        redirect_to root_path
    end

    private
    def survey_params
        params.require(:survey).permit(:title, :question_count, :email)
    end
end
