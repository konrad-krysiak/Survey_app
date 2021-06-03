
require 'rails_helper'

RSpec.describe Answer, type: :model do
  let!(:survey) { create(:survey, title: "Test survey", question_count: 1) }
  let!(:question) { survey.questions.create(content: "How are you today?") }
  let!(:answer) { survey.answers.create(question_id: question.id, content: "im very good") }

  context "Answer" do
    it "should not be valid" do
      expect(answer.question_id).not_to be_nil
      expect(answer.survey_id).not_to be_nil
    end

  end

  context "Content" do
    it "should not be valid if longer than 100 characters" do
      answer.update(content: "A" * 101)
      expect(answer).not_to be_valid
    end

    it "should not be valid if shorter than 3 characters" do
      answer.update(content: "aa")
      expect(answer).not_to be_valid
    end

    it "should be valid if shorter or equal 100 characters and longer than 2 characters" do
      answer.update(content: "A" * 100)
      expect(answer).to be_valid
    end
  end

end
