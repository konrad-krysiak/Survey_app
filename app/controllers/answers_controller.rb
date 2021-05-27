class AnswersController < ApplicationController

    def index

    end

    def new
        @survey_id = params[:survey_id]
        @survey = Survey.find(@survey_id)
        @question_quantity = @survey.question_count
        @questions = Question.where(survey_id: @survey_id)
    end

    def create
        @survey = Survey.find(params[:survey_id])
        attributes = params[:answers].map{|a| {question: @survey.questions.find(a[:question_id]), content: a[:content]} }
        @answers = @survey.update!(answers_attributes: attributes)
        redirect_to root_path

    rescue ActiveRecord::RecordInvalid => e
        @survey_id = @survey.id
        @question_quantity = @survey.question_count
        @questions = @survey.questions
        render action: :new
    end

    def public_answer
        @survey = Survey.find_by(publicUrl: params.require(:public_url))
        @survey_id = @survey.id
        @question_quantity = @survey.question_count
        @questions = Question.where(survey_id: @survey_id)
        render :new
    end

end
