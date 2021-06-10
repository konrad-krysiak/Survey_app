require "application_system_test_case"

class MainTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path
  
    assert_selector "h1", text: "Welcome on the board!"
    assert_selector "a", text: "CREATE NEW SURVEY"
  end
end
