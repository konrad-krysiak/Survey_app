require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
	  @survey2 = surveys(:two)
  end

  test "expect question be in question_table" do
    visit survey_path(@survey)
    assert_text "test question one"
    assert_text "test question two"
  end

  test "expect to throw an error when submiting empty question" do
    visit new_survey_question_path(@survey2)
    fill_in "Question 1", with: ""
    click_on "Submit"
    assert_text "Questions content can't be blank"
  end

  test "expect to throw an error when submiting too long question" do
    visit new_survey_question_path(@survey2)
    fill_in "Question 1", with: "a"*51
    click_on "Submit"
    assert_text "Questions content is too long (maximum is 50 characters)"
  end
end
