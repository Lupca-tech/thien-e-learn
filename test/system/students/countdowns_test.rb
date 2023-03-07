require "application_system_test_case"

class CountdownsTest < ApplicationSystemTestCase
  setup do
    @countdown = countdowns(:one)
  end

  test "visiting the index" do
    visit countdowns_url
    assert_selector "h1", text: "Students/Countdowns"
  end

  test "creating a Countdown" do
    visit countdowns_url
    click_on "New Students/Countdown"

    fill_in "Student", with: @countdown.student_id
    fill_in "Time", with: @countdown.time
    click_on "Create Countdown"

    assert_text "Countdown was successfully created"
    click_on "Back"
  end

  test "updating a Countdown" do
    visit countdowns_url
    click_on "Edit", match: :first

    fill_in "Student", with: @countdown.student_id
    fill_in "Time", with: @countdown.time
    click_on "Update Countdown"

    assert_text "Countdown was successfully updated"
    click_on "Back"
  end

  test "destroying a Countdown" do
    visit countdowns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Countdown was successfully destroyed"
  end
end
