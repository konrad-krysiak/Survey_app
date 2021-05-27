require 'rails_helper'

RSpec.describe Survey, type: :model do
  let!(:survey) { create(:survey, name: "My Survey", question_count: 0) }

  context "Survey Name" do
    it "should not be valid it its shorter than 5 characters" do
      survey.update(name: 'AA')
      expect(survey).not_to be_valid
    end

    it "should not be valid if its longer than 100 characters" do
      survey.update(name: "A" * 101)
      expect(survey).not_to be_valid
    end

    it "should be valid if its shorter or equal than 100 characters" do
      survey.update(name: "A" * 100)
      expect(survey).to be_valid
    end

    it "should not be valid if it contains special characters" do
      survey.update(name: "#^*%^&$#%@#")
      expect(survey).not_to be_valid
    end
  end

  context "Question Count" do
    it "should not be valid if is bigger than 10" do
      survey.update(question_count: 11)
      expect(survey).not_to be_valid
    end

    it "should be valid if its smaller or equal to 10" do 
      survey.update(question_count: 10)
      expect(survey).not_to be_valid
    end
  end
end
