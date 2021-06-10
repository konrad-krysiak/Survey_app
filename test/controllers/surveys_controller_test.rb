require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  # test "should get index" do
  #   get surveys_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_survey_url
  #   assert_response :success
  # end

  # test "should create survey" do
  #   assert_difference('Survey.count') do
  #     post surveys_url, params: { survey: { title: "New test survey", question_count: 2 } }
  #   end

  #   assert_redirected_to survey_url(Survey.last)
  # end

  # test "should show survey" do
  #   get survey_url(@survey)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_survey_url(@survey)
  #   assert_response :success
  # end

  # test "should update survey" do
  #   @s = Survey.last
  #   patch survey_url(@s), params: { survey: { title: "updated" } }
  #   assert_redirected_to survey_url(@s)
  # end

  # test "should destroy survey" do
  #   assert_difference('Survey.count', -1) do
  #     delete survey_url(@survey)
  #   end

  #   assert_redirected_to surveys_url
  # end
end
