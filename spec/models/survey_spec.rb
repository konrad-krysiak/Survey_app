require 'rails_helper'

RSpec.describe Survey, type: :model do
  let!(:survey) { create(:survey, title: "My Survey", email: "asd@asd.pl", question_count: 1) }

  context "Survey Name" do
    it "should not be valid it its shorter than 5 characters" do
      survey.update(title: 'AA')
      expect(survey).not_to be_valid
    end

    it "should not be valid if its longer than 50 characters" do
      survey.update(title: "A" * 51)
      expect(survey).not_to be_valid
    end

    it "should be valid if its shorter or equal than 50 characters and longer than 5 characters" do
      survey.update(title: "A" * 50)
      expect(survey).to be_valid
    end

    it "should not be valid if it contains special characters" do
      survey.update(title: "#^*%^&$#%@#")
      expect(survey).not_to be_valid
    end
  end

  context "Question Count" do
    it "should not be valid if is bigger than 10" do
      survey.update(question_count: 11)
      expect(survey).not_to be_valid
    end

    it "should not to be valid if is equal to 0" do
      survey.update(question_count: 0)
      expect(survey).not_to be_valid
    end

    it "should be valid if its smaller or equal to 10" do 
      survey.update(question_count: 10)
      expect(survey).to be_valid
    end
  end

  context "Survey email" do
    it "should not be valid if its incorrect" do
      survey.update(email: "test.pl")
      expect(survey).not_to be_valid
    end

    it "should be valid if its correct" do
      survey.update(email: "asd@asd.pl")
      expect(survey).to be_valid
    end
  end
end
