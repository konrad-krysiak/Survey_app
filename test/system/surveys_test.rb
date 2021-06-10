require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
	  @survey2 = surveys(:two)
  end

  test "visiting the index" do
    visit root_path
    assert_selector "h1", text: "Welcome on the board!"
  end

  test "creating a Survey" do
    visit root_path
    find(".create-button").click
    fill_in "survey_title", with: "Creating an Survey"
    fill_in "survey_question_count", with: "2"
    fill_in "survey_email", with: "asd@asd.com"
    click_on "Create Survey"
    assert_text "Question 1"
    assert_text "Question 2"
  end

  test "creating a Survey with a blank title field" do
	visit root_path
  find(".create-button").click
	fill_in "survey_title", with: ""
  fill_in "survey_question_count", with: "1"
  fill_in "survey_email", with: "asd@asd.com"
  click_on "Create Survey"
	assert_text "Title can't be blank"
  end

  test "creating a Survey with negative number of questions" do
	visit root_path
  find(".create-button").click
	fill_in "survey_title", with: "Creating an Survey"
  fill_in "survey_question_count", with: "-5"
  fill_in "survey_email", with: "asd@asd.com"
  click_on "Create Survey"
	assert_text "Question count is not included in the list"
  end

  test "creating a Survey with invalid email" do
	visit root_path
  find(".create-button").click
	fill_in "survey_title", with: "Creating an Survey"
  fill_in "survey_question_count", with: "1"
  fill_in "survey_email", with: "nanana"
  click_on "Create Survey"
	assert_text "Email is invalid"
  end

  test "creating survey with questions" do
    visit new_survey_question_path(@survey2)
    fill_in "Question 1", with: "Some question text"
    click_on "Submit"
    assert_selector "h3", text: @survey2.title
    assert_text "Share: /e04dfc988ea7f09ffd30"
  end

  test "expect newly created survey to have hash publicUrl generated" do
    visit new_survey_question_path(@survey2)
    fill_in "Question 1", with: "Some question text"
    click_on "Submit"
    if @survey2.publicUrl.blank?
      return false
    end
  end

	test "expect newly created survey to have no answers" do
		visit new_survey_question_path(@survey2)
		fill_in "Question 1", with: "Some question text"
		click_on "Submit"
		assert_selector "h4", text: "No answers yet."
	end

  test "visiting survey path" do
    visit survey_path(@survey)
    assert_selector "h3", text: @survey.title
    assert_selector "h3", text: "Answers"
  end

  test "destroying a Survey" do
    visit survey_path(@survey)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_selector "h1", text: "Welcome on the board!"
  end
end
