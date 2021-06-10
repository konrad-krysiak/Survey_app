require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
	  @survey2 = surveys(:two)
  end

  test "expect to be able to answer for a survey" do
    visit new_survey_answer_path(@survey)
    assert_text "Answer to #{@survey.title} questions!"
  end

  test "expect an error while leaving some questions unanswered" do
    visit new_survey_answer_path(@survey)
    click_on "Submit"
    assert "Answers content can't be blank"
    assert "Answers content is too short (minimum is 3 characters)"
  end

  test "after answering a survey expect to be redirected to landing page" do
    visit new_survey_answer_path(@survey)
    fill_in "121", with: "Answer to first question"
    fill_in "122", with: "Answer to second question"
    click_on "Submit"
    assert_text "Welcome on the board!"
  end

  test "expect visibility of new answers on survey's show page" do
    visit new_survey_answer_path(@survey)
    fill_in "121", with: "Answer to first question"
    fill_in "122", with: "Answer to second question"
    click_on "Submit"
    visit survey_path(@survey)
    assert_text "Answer to first question"
    assert_text "Answer to second question"
  end
end
