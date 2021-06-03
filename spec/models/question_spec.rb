
require 'rails_helper'

RSpec.describe Question, type: :model do
  let!(:survey) { create(:survey, title: "Test survey", question_count: 2) }
  let!(:question) { survey.questions.create(content: "How are you today?") }

  context "Survey" do
    it "should not be valid" do
      expect(question.survey_id).not_to be_nil
    end

  end

  context "Content" do
    it "should not be valid if longer than 50 characters" do
      question.update(content: "A" * 51)
      expect(question).not_to be_valid
    end

    it "should not be valid if shorter than 3 characters" do
      question.update(content: "aa")
      expect(question).not_to be_valid
    end

    it "should be valid if shorter or equal 50 characters and longer than 2 characters" do
      question.update(content: "A" * 50)
      expect(question).to be_valid
    end

    it "should be unique in survey" do
      question2 = build(:question, content: "How are you today?")
      expect(question2).not_to be_valid
    end
  end

end
