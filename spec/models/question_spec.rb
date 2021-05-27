
require 'rails_helper'

RSpec.describe Question, type: :model do
  let!(:question) { create(:question, content: "How are you today?") }

  context "Survey" do
    it "should not be valid" do
      expect(question.survey_id).not_to be_nil
    end

  end

  context "Content" do
    it "should not be valid if longer than 50 characters" do
      question.update(content: 51 * "A")
      expect(question).not_to be_valid
    end

    it "should be valid if shorter or equal 50 characters" do
      question.update(content: 50 * "A")
      expect(question).to be_valid
    end

    it "should be at least 5 characters long" do
      question.update(content: "WHY?")
      expect(question).not_to be_valid
    end
    
    it "should contain question mark" do
      question.update(content: "Maybe some banana")
      expect(question).not_to be_valid
    end

    it "should be unique in survey" do
      question2 = build(:question, content: "How are you today?")
      expect(question2).not_to be_valid
    end
  end

end
